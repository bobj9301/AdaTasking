with System;
with System.Address_Image;
with Local_Types; use Local_Types;
with Ada.Text_IO; use Ada.Text_IO;
with Spmw; use Spmw;

package body Mw_Tasking is

   -- Receiver_Task
   ---------------------------------------------------------------------------

   task body Receiver_Task is

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

      loop

            declare

               Bytes_Read : Int32;
               Message_Id : Int32;
               Read_Status : Mw_Status_T;
               Message_Address : System.Address;

            begin

               Put_Line("Receiver Loop: " & Integer'Image(My_Id));

               Mw_Msg_Receive(Spmw.Channel_A,
                              Message_Address,
                              Bytes_Read,
                              Message_Id,
                              Read_Status);

               declare

                  Received_Message : Integer;
                  for Received_Message'Address use Message_Address;

               begin

                  Local_Message := Received_Message;

               end;

               Status := Spmw.Mw_Msg_Free(Message_Address);

            end;

            Put_Line("Recieved_Message: " & Integer'Image(Local_Message));

         delay 0.0;

      end loop;

      Put_Line("Ending Receiver : " & Integer'Image(My_Id));

      delay 10.0;

   end Receiver_Task;

   -- Sender_Task
   ---------------------------------------------------------------------------

   task body Sender_Task is

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
      Increment : Int32 := 0;

   begin

      -- block until started with call to begin_looping

      accept Begin_Looping(Task_Id : in Integer) do

         My_Id := Task_Id;

         if my_id = 2 then

           increment := 2;

         elsif my_id = 3 then

           increment := 3;

         elsif my_id = 4 then
           increment := 4;
         elsif my_id = 5 then
           increment :=5 ;
         else
           increment := 1;
         end if;

      end Begin_Looping;

      Msg_Nbytes := Integer'Size/8;

      -- for Iteration in 1..3 loop
       loop


            Spmw.Mw_Msg_Alloc(Chan_Id => Channel_A,
                              Msg_Address => Message_Address,
                              N_Bytes => Msg_Nbytes,
                              Status => Alloc_Status);

            declare

               Output_Message : Int32;
               for Output_Message'Address use Message_Address;

            begin

               Msg_Id := 5;
--               Output_Message := Message_To_Send;
               Output_Message := Increment;

               Put_Line(Integer'Image(My_ID) & " sending message: " & Int32'Image(Output_Message));

               Status := Spmw.Mw_Msg_Send(Spmw.Channel_A,
                                          Message_Address,
                                          Msg_Nbytes,
                                          Msg_Id);
            end;

--            Message_To_Send := Message_To_Send + increment;

         delay 0.0;

      end loop;

      Put_Line("Ending Sender : " & Integer'Image(My_Id));

      delay 10.0;

   end Sender_Task;

end Mw_Tasking;
