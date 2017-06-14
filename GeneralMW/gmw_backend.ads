with System;
with System.Storage_Elements;
with Ada.Exceptions;
with Local_Types; use Local_Types;

package Gmw_Backend is

   -- ======================================================================================
   -- Type Definitions


   Channel_Pool_Size : constant := 1024;

   type Block_Type is array (Positive range <>) of Int32;
   pragma Pack(Block_Type);

   type Block_Access_Type is access all Block_Type;

   type Block_Allocation_Type is
      record
         Data_Address : System.Address;
         Msg_Id       : Int32;
         Length       : Int32;
         Msg_Count    : Int32;
      end record;

   type Channel_Pool_Ptr_Type is mod(Channel_Pool_Size - 1);
   type Channel_Allocation_Counter_Type is range 0 .. Channel_Pool_Size;
   type Channel_Pool_Type is array (Channel_Pool_Ptr_Type) of Block_Allocation_Type;

   protected type Channel_Type is

      procedure Write(In_Addr : in System.Address;
                  In_Len  : in Int32;
                  In_Id   : in Int32);

   private

      Pool : Channel_Pool_Type;
      Next_In : Channel_Pool_Ptr_Type := 0;
      Next_Out : Channel_Pool_Ptr_Type := 0;
      Count    : Channel_Allocation_Counter_Type := 0;
      Request_Count : Integer := 0;

   end Channel_Type;


end Gmw_Backend;

