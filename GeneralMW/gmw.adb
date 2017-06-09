with System.Memory;
with System;
with System.Storage_Elements;
with System.Address_To_Access_Conversions;
with Ada.Unchecked_Deallocation;
with Ada.Task_Identification;
with System.Address_Image;

with Ada.Text_Io; use Ada.Text_Io;

package body Gmw is

   -- ======================================================================================
   -- Define Channel Manager Task

   task type Channel_Manager_Task is

      entry Write_Request(Chan_Id    : in Chan_Id_T;
                          Msg_Address: in System.Address;
                          N_Bytes    : in Int32;
                          Message_Id : in Int32);

      entry Read_Request(Chan_Id : in Chan_Id_T;
                         Msg_Address :    out System.Address;
                         N_Bytes     :    out Int32;
                         Message_Id  :    out Int32;
                         Status      :    out Mw_Status_T);

   end Channel_Manager_Task;

   task body Channel_Manager_Task is separate;

   Channel_Manager : Channel_Manager_Task;

   type Block_Type is array (Positive range <> ) of Int32;
   pragma Pack(Block_Type);

   type Block_Access_Type is access all Block_Type;

   -- ======================================================================================
   -- Define mw handler bodies

   function Mw_Msg_Send(Chan_Id    : in Chan_Id_T;
                        Msg_Address: in System.Address;
                        N_Bytes    : in Int32;
                        Message_Id : in Int32) return Mw_Status_T is separate;

   procedure Mw_Msg_Receive(Chan_Id     : in      Chan_Id_T;
                            Msg_Address :     out System.Address;
                            N_bytes     :     out Int32;
                            Message_Id  :     out Int32;
                            Status      :     out Mw_Status_T) is separate;

   procedure Mw_Mem_Alloc(Memory_Area    : in     Mem_Id_T;
                          Memory_Address :    out System.Address;
                          N_Bytes        : in     Int32;
                          Alignment      : in     Int32;
                          Status         :    out Mw_Status_T) is separate;

   procedure Mw_Msg_Alloc(Chan_Id     : in     Chan_Id_T;
                          Msg_Address : in out System.Address;
                          N_Bytes     : in     Int32;
                          Status      : in out Mw_Status_T) is separate;

   function Mw_Msg_Free(Msg_Address : in System.Address) return Mw_Status_T is separate;

end Gmw;
