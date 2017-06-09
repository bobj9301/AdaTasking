with System;
with System.Address_Image;
with Ada.Text_IO; use Ada.Text_IO;

with Gmw; use Gmw;
with Local_Types; use Local_Types;

separate (Test_Tasks)

   task body Incrementer_Task is

      My_Id : Integer;

      Read_Status : Gmw.Mw_Status_T;
      Message_Id : Int32;
      Bytes_Read : Int32;
      Message_Address : System.Address;

   begin

      -- block until started with call to begin_looping

      accept Begin_Looping(Task_Id : in Integer) do

         My_Id := Task_Id;

      end Begin_Looping;

      Put_Line("Incrementer Task started");

      Gmw.Mw_Msg_Receive(Gmw.Channel_A, Message_Address, Bytes_Read, Message_Id, Read_Status);

      declare

         Message_Received : Integer;
         for Message_Received'Address use Message_Address;

      begin

         Put_Line("Incrementer received: " & Integer'Image(Message_Received));

      end;

   end Incrementer_Task;

