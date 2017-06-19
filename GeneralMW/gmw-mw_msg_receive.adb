with System;
with System.Address_Image;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Task_Identification; use Ada.Task_Identification;

separate (Gmw)

procedure Mw_Msg_Receive(Chan_Id     : in      Chan_Id_T;
                         Msg_Address :     out System.Address;
                         N_bytes     :     out Int32;
                         Message_Id  :     out Int32;
                         Status      :     out Mw_Status_T) is

   My_Task_Id : Ada.Task_Identification.Task_Id := Ada.Task_Identification.Current_Task;

begin

   Put_Line("Mw_Msg_Receive called from task: " & Ada.Task_Identification.Image(My_Task_id));

   Channel_Manager.Read_Request(Chan_Id)(Chan_Id, My_Task_Id, Msg_Address, N_Bytes, Message_Id, Status);

end Mw_Msg_Receive;

