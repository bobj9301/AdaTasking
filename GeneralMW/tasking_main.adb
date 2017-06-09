with Ada.Text_Io;
use Ada.Text_Io;

with test_tasks;
use test_tasks;

procedure tasking_main is

   Task_A : Initializer_Task;

   Task_B   : Incrementer_Task;
   Task_C   : Square_Task;

begin

   Task_A.Begin_Looping(1);
   Task_B.Begin_Looping(2);
--   Task_C.Begin_Looping(5);

   Put_Line("main complete");

end tasking_main;
