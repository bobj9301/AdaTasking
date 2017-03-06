with Ada.Text_IO; use Ada.Text_IO;

procedure task_list is


task type Simple_Task is

   entry Start(Num  :  in Integer);
   entry Report(Num : out Integer);

end Simple_Task;

type Task_Pool is array(Positive range 1 .. 1) of Simple_Task;

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

   my_pool : Task_Pool;
   Num : Integer;

begin

   my_pool(1).start(1);
   my_pool(1).report(Num);

   Put_Line("Num: " & Integer'Image(Num));
   
   Put_Line ("Hello World");

end task_list;
