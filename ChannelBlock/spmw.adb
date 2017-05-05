with System.Memory;
with System;
with System.Storage_Elements;
with System.Address_To_Access_Conversions;
with Ada.Unchecked_Deallocation;
with System.Address_Image;
with Block_Defs;

with Ada.Text_Io; use Ada.Text_Io;

package body Spmw is

   Channel_Pool_Size : constant := 1024;
   type Channel_Pool_Ptr_Type is mod (Channel_Pool_Size - 1);
   type Channel_Allocation_Counter_Type is range 0 .. Channel_Pool_Size;
   type Channel_Pool_Type is array (Channel_Pool_Ptr_Type) of Block_Defs.Block_Allocation_Type;


   procedure Delete_Block is new Ada.Unchecked_Deallocation(Block_Defs.Block_Type,
                                                            Block_Defs.Block_Access_Type);

   Msg_Count : Int32 := 0;

   -- ==========================================================================

   protected type Channel is

      entry Write(In_Addr : in System.Address;
                  In_Len  : in Int32;
                  In_Id   : in Int32);

      entry Read(Out_Addr : out System.Address;
                 Out_Len  : out Int32;
                 Out_Id   : out Int32);

      procedure Alloc(Out_Addr : out System.Address;
                      In_Len   : in Int32);

   private

      Pool     : Channel_Pool_Type;
      Next_In  : Channel_Pool_Ptr_Type   := 0;
      Next_Out : Channel_Pool_Ptr_Type   := 0;
      Count    : Channel_Allocation_Counter_Type := 0;
      Read_Empty : Boolean    := False;

   end Channel;

   package Sys_Pointer is new System.Address_To_Access_Conversions(Block_Defs.Block_Access_Type);

   -- ==========================================================================

   Channels : array(Chan_Id_T) of Channel;

   protected body Channel is

      procedure Alloc(Out_Addr :    out System.Address;
                      In_Len   : in      Int32) is

           Block_Access : Block_Defs.Block_Control_Type;
      begin

         Block_Defs.Set_Block_Size(Block_Access, In_Len);

    --     Block_Access.all := (others =>0);
         Out_Addr := Block_access.Data_Ptr.all'Address;

      end Alloc;

      -- ========== Write =======================

      entry Write(In_Addr : in System.Address;
                  In_Len  : in Int32;
                  In_Id   : in Int32) when Count < (Channel_Pool_Size -1 ) is

      begin

         Count := Count + 1;
         Pool(Next_In).Data_Address  := In_Addr;
         Pool(Next_In).Msg_Id := In_Id;
         Pool(Next_In).Msg_Count  := Spmw.Msg_Count;
         Pool(Next_In).Length     := In_Len;
         Pool(Next_In).Allocated  := True;

         Next_In := Next_In + 1;

      end;

      -- ========= Read =====================

      entry Read(Out_Addr : out System.Address;
                 Out_Len  : out Int32;
                 Out_Id   : out Int32) when (Count > 0) is

      begin

         Out_Addr := Pool(Next_Out).Data_Address;
         Out_Len  := Pool(Next_Out).Length;
         Out_Id   := Pool(Next_Out).Msg_Id;
         Count := Count -1;
         Next_Out := Next_Out + 1;

      end;

   end Channel;

   -- ==========================================================================

   function Mw_Msg_Send(Chan_Id    : in Chan_Id_T;
                        Msg_Address: in System.Address;
                        N_Bytes    : in Int32;
                        Message_Id : in Int32) return Mw_Status_T is

   begin

      Channels(Chan_Id).Write(In_Addr    => Msg_Address,
                              In_Len     => N_Bytes,
                              In_Id => Message_Id);

      return Mw_Ok;

   end;

   -- ==========================================================================

   procedure Mw_Msg_Receive(Chan_Id     : in      Chan_Id_T;
                            Msg_Address :     out System.Address;
                            N_bytes     :     out Int32;
                            Message_Id  :     out Int32;
                            Status      :     out Mw_Status_T) is
   begin

      Channels(Chan_Id).Read(Out_Addr => Msg_Address,
                             Out_Len  => N_Bytes,
                             Out_Id   => Message_Id);

      Status := Mw_Ok;

   end;

   -- ==========================================================================

   procedure Mw_Mem_Alloc(Memory_Area    : in     Mem_Id_T;
                          Memory_Address :    out System.Address;
                          N_Bytes        : in     Int32;
                          Alignment      : in     Int32;
                          Status         :    out Mw_Status_T) is

      Block_Access : Block_Defs.Block_Access_Type := new Block_Defs.Block_Type(1..Integer(N_Bytes));

   begin

      Block_Access.all := (others => 0);
      Memory_Address := Block_Access.all'Address;

      Status := Mw_Ok;
   end;
   -- ==========================================================================
   procedure Mw_Msg_Alloc(Chan_Id : in Chan_Id_T;
                          Msg_Address : in out System.Address;
                          N_Bytes : in Int32;
                          Status : in out Mw_Status_T) is

   begin

      Channels(Chan_Id).Alloc(Out_Addr => Msg_Address, In_Len => N_Bytes);
      Status := Mw_Ok;

   end;

   -- ==========================================================================

   package Block_Pointer is new System.Address_To_Access_Conversions(Block_Defs.Block_Type);


   function Mw_Msg_Free(Msg_Address : in System.Address) return Mw_Status_T Is

      Block_Access : Block_Defs.Block_Access_Type;

   begin

      Block_Access := Block_Defs.Block_Access_Type(Block_Pointer.To_Pointer(Msg_Address));

      Delete_Block(Block_Access);

      return Mw_Ok;

   end Mw_Msg_Free;

end Spmw;
