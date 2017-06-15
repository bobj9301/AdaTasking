with System;
with System.Address_Image;
with Ada.Text_IO; use Ada.Text_IO;
with Gmw;
with Gmw_Backend; use Gmw_Backend;

separate (Gmw)

   task body Channel_Manager_Task is

      Channel_Pool : array (Chan_Id_T) of Gmw_Backend.Channel_Type;

   begin

      Put_Line("Channel_Manager Task started");

      loop

         for I in Chan_Id_T'Range loop

         --   select

               accept Write_Request(i)(Chan_Id    : in Chan_Id_T;
                                       Msg_Address: in System.Address;
                                       N_Bytes    : in Int32;
                                       Message_Id : in Int32) do

                  Put_Line("Write_Request Recieved in Channel_manager " & Chan_Id_T'Image(I) );
                  Channel_Pool(Chan_Id).Write(Msg_Address,N_Bytes,Message_Id);

               end Write_Request;
       --     or
               accept Read_Request(i)(Chan_Id : in Chan_Id_T;
                                      Msg_Address :    out System.Address;
                                      N_Bytes     :    out Int32;
                                      Message_Id  :    out Int32;
                                      Status      :    out Mw_Status_T) do

                  Put_Line("Read_Request recieved in Channel_Manager " & Chan_Id_T'Image(I) );

                  Channel_Pool(Chan_Id).Read(Msg_Address, N_Bytes, Message_Id);

               end Read_Request;
     --       else
     --         null;

   --         end select;

         end loop;

      end loop;

   end Channel_Manager_Task;

