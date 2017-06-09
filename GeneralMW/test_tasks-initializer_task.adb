with System;
with System.Address_Image;
with Ada.Text_IO; use Ada.Text_IO;
with Gmw; use Gmw;
with Local_Types; use Local_Types;

separate (Test_Tasks)

   task body Initializer_Task is

      My_Id : Integer;

      Allocation_Status : Gmw.Mw_Status_T := Gmw.Mw_No_Allocation;
      Allocated_Address : System.Address;

      Send_Status : Gmw.Mw_Status_T := Gmw.Mw_No_Message;

   begin

      -- block until started with call to begin_looping

      accept Begin_Looping(Task_Id : in Integer) do

         My_Id := Task_Id;

      end Begin_Looping;

      Put_Line("Initializer Task started");

      Gmw.Mw_Msg_Alloc(Gmw.Channel_A, Allocated_Address, integer'Size, Allocation_Status);

      if Allocation_Status = Gmw.Mw_Ok then

         declare

            Message_To_Send_Int : Integer;
            for Message_To_Send_Int'Address use Allocated_Address;

            Message_Id : Int32 := 1;

         begin

            Message_To_Send_Int := 3;

            Send_Status := Gmw.Mw_Msg_Send(Gmw.Channel_A, Allocated_Address, Message_To_Send_Int'Size, Message_Id);

            Put_Line("Initialize: Send complete");

         end;

      else

           Put_Line("Error:Initializer_Task:Allocation_Failed");

      end if;



   end Initializer_Task;

