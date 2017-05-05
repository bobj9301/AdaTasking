with System;
with System.Address_Image;
with Local_Types; use Local_Types;
with Ada.Text_IO; use Ada.Text_IO;
with Spmw; use Spmw;

package body Mw_Tasking is

   task body Simple_Task is

  --    Local_Num : Integer;
      Status : Spmw.Mw_Status_T;
      Alloc_Status : Spmw.Mw_Status_T;

      Message_Address : System.Address;
      Msg_Nbytes : Int32 ; --:= Integer'Size/8;
      Msg_Id     : Int32;
      My_Id    : Integer;
      Message_To_Send : Int32 := 2345;
      Message_Received : Integer;
      Local_Message    : Integer;

   begin

      -- block until started with call to begin_looping

      accept Begin_Looping(Task_Id : in Integer) do

         My_Id := Task_Id;

      end Begin_Looping;

      Msg_Nbytes := Integer'Size/8;



      for Iteration in 1..2 loop

         if My_Id = 1 then

            Spmw.Mw_Msg_Alloc(Chan_Id => Channel_A,
                              Msg_Address => Message_Address,
                              N_Bytes => Msg_Nbytes,
                              Status => Alloc_Status);

            declare

               Output_Message : Int32;
               for Output_Message'Address use Message_Address;

            begin

               Msg_Id := 5;
               Output_Message := Message_To_Send;
               Put_Line("sending message: " & Int32'Image(Message_To_Send));

               Status := Spmw.Mw_Msg_Send(Spmw.Channel_A,
                                          Message_Address,
                                          Msg_Nbytes,
                                          Msg_Id);
            end;

            Message_To_Send := Message_To_Send + 1;

         end if;

         if My_Id = 2 then

            declare

               Bytes_Read : Int32;
               Message_Id : Int32;
               Read_Status : Mw_Status_T;
               Message_Address : System.Address;

            begin

               Mw_Msg_Receive(Spmw.Channel_A,
                              Message_Address,
                              Bytes_Read,
                              Message_Id,
                              Read_Status);

               declare

                  Received_Message : Integer;
                  for Received_Message'Address use Message_Address;

               begin

         --         Put_Line("Received Address: " & System.Address_Image(Message_Address));

                  Local_Message := Received_Message;

               end;

               Status := Spmw.Mw_Msg_Free(Message_Address);

            end;

            Put_Line("Local_Message: " & Integer'Image(Local_Message));

         end if;

         delay 0.0;

      end loop;

   end Simple_Task;

end Mw_Tasking;
