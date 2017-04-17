with System;
with Ada.Text_IO; use Ada.Text_IO;
with Spmw; use Spmw;

package body Mw_Tasking is

   task body Simple_Task is

      Local_Num : Integer;
      Status : Spmw.Mw_Status_T;
      Alloc_Status : Spmw.Mw_Status_T;

      Message_Address : System.Address;
      Msg_Nbytes : Spmw.Int32;
      Msg_Id     : Spmw.Int32;
   begin

      accept Begin_Looping do
        Msg_Id := 0;
      end;
      loop
         select
            accept Start(Num : in Integer) do

               Put_Line("Start accepted");

               Spmw.Mw_Mem_Alloc(Memory_Area => Mw_Ram,
                                 Memory_Address => Message_Address,
                                 N_Bytes => Msg_Nbytes,
                                 Alignment => 1,
                                 Status => Alloc_status);

               Msg_Id := 4;
               Msg_Nbytes := 1;

               Put_Line("calling send");

               Status := Spmw.Mw_Msg_Send(Spmw.Channel_A,
                                          Message_Address,
                                          Msg_Nbytes,
                                          Msg_Id);

               Put_Line("Task id: " & Integer'Image(Num));
               Local_Num := Num;

               Put_Line("Subtask started");

            end Start;

         or

            accept Report(Num : out Integer) do

               Put_Line("Report: ");

               declare
                  Bytes_Read : Int32;
                  Message_Id : Int32;
                  Read_Status : Mw_Status_T;
                  Message_Address : System.Address;
               begin

      --            Mw_Msg_Receive(Spmw.Channel_A,
      --                           Message_Address,
      --                           Bytes_Read,
      --                           Message_Id,
      --                           Read_Status);

                  Put_Line("Message_Id read from channel_A, " & Int32'Image(Message_Id));

                  Num := Local_Num;

               end;

            end Report;

         end select;

      end loop;

   end Simple_Task;

end Mw_Tasking;
