with System;
with System.Storage_Elements;
with Ada.Exceptions;
with Local_Types; use Local_Types;

package Gmw is

   pragma Elaborate_Body;

   -- ======================================================================================
   -- Type Definitions

   type Mem_Id_T is (Mw_Ram);

   type Mw_Status_T is
     (Mw_Ok,            -- Success
      Mw_Bad_Cout,      -- Bad reference count
      Mw_Illeagal_Chan, -- Invalid channel
      Mw_No_Message,
      Mw_Send_Failed,
      Mw_Recv_Failed,
      Mw_Memory_Range,
      Mw_No_Allocation
     );

   -- ======================================================================================
   -- Channel Definitions

   type Chan_Id_T is
     ( Channel_A, Channel_B);

   for Chan_Id_T use ( 0, 1);
   for Chan_Id_T'Size use 32;

   -- ======================================================================================
   -- Message handling routines used by processing code to send/receive messages
   --
   -- Expected functional flow
   --
   --    Sending Function
   --       1) Allocate memory space with mw_msg_alloc
   --       2) Create message with 'address as newly allocated space
   --       3) Fill message
   --       4) Send message using MW_Msg_Send
   --
   --    Receiving Function
   --       1) Call Msg_Receive to accept message
   --       2) Process received message
   --       3) Free memory space using Mw_Msg_Free
   --

   function Mw_Msg_Send(Chan_Id    : in Chan_Id_T;
                        Msg_Address: in System.Address;
                        N_Bytes    : in Int32;
                        Message_Id : in Int32) return Mw_Status_T;

   procedure Mw_Msg_Receive(Chan_Id     : in      Chan_Id_T;
                            Msg_Address :     out System.Address;
                            N_bytes     :     out Int32;
                            Message_Id  :     out Int32;
                            Status      :     out Mw_Status_T);

   procedure Mw_Mem_Alloc(Memory_Area    : in     Mem_Id_T;
                          Memory_Address :    out System.Address;
                          N_Bytes        : in     Int32;
                          Alignment      : in     Int32;
                          Status         :    out Mw_Status_T);

  procedure Mw_Msg_Alloc(Chan_Id     : in     Chan_Id_T;
                         Msg_Address : in out System.Address;
                         N_Bytes     : in     Int32;
                         Status      : in out Mw_Status_T);

   function Mw_Msg_Free(Msg_Address : in System.Address) return Mw_Status_T;

end Gmw;

