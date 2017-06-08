with System;
with System.Address_Image;
with Ada.Text_IO; use Ada.Text_IO;
with Gmw;

separate (Test_Tasks)

   task body Initializer_Task is

      Message_Received : Integer;
      Local_Message    : Integer;
      My_Id : Integer;

   begin

      -- block until started with call to begin_looping

      accept Begin_Looping(Task_Id : in Integer) do

         My_Id := Task_Id;

      end Begin_Looping;

      Put_Line("Initializer Task started");



   end Initializer_Task;
