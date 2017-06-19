with System;
with System.Storage_Elements;
with Ada.Exceptions;
with Ada.Task_Identification; use Ada.Task_Identification;

with Local_Types; use Local_Types;

package Gmw_Backend is

   -- ======================================================================================
   -- Type Definitions

   type Device_Type is (Memory,
                        File,
                        Device, -- unhandled hardware device
                        TRM);
   type Connection is
      record
         Connection_Type : Device_Type;
         Connection_Owner_Id : Ada.Task_Identification.Task_Id;
      end record;

   type Connection_List_Type is array (1 .. 16) of Connection;

   Channel_Pool_Size : constant := 1024;

   type Block_Type is array (Positive range <>) of Int32;
   pragma Pack(Block_Type);

   type Block_Access_Type is access all Block_Type;

   type Block_Allocation_Type is
      record
         Data_Address : System.Address;
         Msg_Id       : Int32;
         Length       : Int32;
         Msg_Count    : Int32; -- sequence number of message on this channel
      end record;

   type Channel_Pool_Ptr_Type is mod(Channel_Pool_Size - 1);
   type Channel_Allocation_Counter_Type is range 0 .. Channel_Pool_Size;
   type Channel_Pool_Type is array (Channel_Pool_Ptr_Type) of Block_Allocation_Type;

   protected type Channel_Type is

      entry Write(In_Addr : in System.Address;
                  In_Len  : in Int32;
                  In_Id   : in Int32);

      entry Read(Out_Addr : out System.Address;
                 Out_Len  : out Int32;
                 Out_Id   : out Int32);

   private

      Connection_List : Connection_List_Type;
      Connection_Count : Int32 := 0;

      Pool : Channel_Pool_Type;                -- Data buffer array
      Next_In : Channel_Pool_Ptr_Type := 0;    -- Index of next buffer to fill with write
      Next_Out : Channel_Pool_Ptr_Type := 0;   -- Index of next buffer to be read
      Count    : Int32 := 0;                   -- Number of messages available in channel
      Request_Count : Integer := 0;

   end Channel_Type;


end Gmw_Backend;

