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

      accept Start(Num : in Integer) do

         Spmw.Mw_Mem_Alloc(Memory_Area => Mw_Ram,
                           Memory_Address => Message_Address,
                           N_Bytes => Msg_Nbytes,
                           Alignment => 1,
                           Status => Alloc_status);

         Msg_Id := 3;
         Msg_Nbytes := 1;

         Status := Spmw.Mw_Msg_Send(Spmw.Channel_A,
                                Message_Address,
                                Msg_Nbytes,
                                Msg_Id);

         Put_Line("Task id: " & Integer'Image(Num));
         Local_Num := Num;

         if Local_Num < 10 then

            Local_Num := Local_Num + 1;

            declare
               subtask : Task_Pool;
            begin
               Put_Line("starting subtask " & Integer'Image(Local_Num));
               subtask(1).start(Local_Num);
            end;

           Put_Line("Subtask started");

         end if;

      end Start;

      accept Report(Num : out Integer) do

         Num := Local_Num;

      end Report;

   end Simple_Task;

end Mw_Tasking;
