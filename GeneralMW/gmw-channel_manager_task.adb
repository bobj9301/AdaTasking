with System;
with System.Address_Image;
with Ada.Text_IO; use Ada.Text_IO;
with Gmw;

separate (Gmw)

   task body Channel_Manager_Task is

   begin

      Put_Line("Channel_Manager Task started");

      loop

         accept Write_Request(Chan_Id    : in Chan_Id_T;
                              Msg_Address: in System.Address;
                              N_Bytes    : in Int32;
                              Message_Id : in Int32) do

            Put_Line("Write_Request Recieved in Channel_manager");

         end Write_Request;

         accept Read_Request(Chan_Id : in Chan_Id_T;
                             Msg_Address :    out System.Address;
                             N_Bytes     :    out Int32;
                             Message_Id  :    out Int32;
                             Status      :    out Mw_Status_T) do

            Put_Line("Read_Request recieved in Channel_Manager");

         end Read_Request;

      end loop;

   end Channel_Manager_Task;

