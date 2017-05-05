with System;
with Ada.Finalization;
with Ada.Text_Io; use Ada.Text_Io;
with Local_Types; use Local_Types;

package Block_Defs is

   -- Used by spmw
   -- ====================================================
   type Block_Type is array(Positive range <>) of Int32;
   pragma Pack(Block_Type);

   type Block_Access_Type is access all Block_Type;

   type Block_Control_Type is new Ada.Finalization.Controlled with
      record
         Reference_Count : Natural := 0;
         Data_Ptr : Block_Access_Type;
      end record;

   type Block_Allocation_Type is
      record
         Data_Address : System.Address;
         Msg_Id       : Int32;
         Length       : Int32;
         Msg_Count    : Int32;
         Allocated    : Boolean := False;
      end record;

   procedure Finalize(Block : in out Block_Control_Type);
   procedure Initialize(Block : in out Block_Control_Type);
   procedure Adjust(Block : in out Block_Control_Type);

   -- ====================================================
   -- Used by controlled types test code
   type Block_Buffer is new Ada.Finalization.Controlled with
      record
         Reference_Count : Natural := 0;
         Size : Integer := 0;
      end record;

   type Block_Buffer_Access_Type is access all Block_Buffer'Class;

   type Block_Buffer_Access_CType is new Ada.Finalization.Controlled with
      record
         Data : Block_Buffer_Access_Type;
      end record;

   procedure Finalize(Block : in out Block_Buffer);
   procedure Initialize(Block : in out Block_Buffer);
   procedure Adjust(Block : in out Block_Buffer);

   procedure Finalize(Block : in out Block_Buffer_Access_CType);
   procedure Initialize(Block : in out Block_Buffer_Access_CType);
   procedure Adjust(Block : in out Block_Buffer_Access_CType);

   -- ====================================================

   procedure Set_Block_size( Block : in out Block_Control_Type;
                             Size : in Int32);
end Block_Defs;


