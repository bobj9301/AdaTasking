with Ada.Text_IO; use Ada.Text_IO;

package body Mw_Tasking is

   task body Simple_Task is

      Local_Num : Integer;

   begin


      accept Start(Num : in Integer) do

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
