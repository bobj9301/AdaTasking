with Ada.Text_Io;
use Ada.Text_Io;

with mw_tasking;
use mw_tasking;

procedure tasking_main is

   my_pool : Task_Pool;

begin

   My_Pool(1).Begin_Looping(1);
   My_Pool(2).Begin_Looping(2);

--   my_pool(1).start(1);
--   My_Pool(1).Start(2);
--   My_Pool(2).Report(Num);

   Put_Line("main complete");

end tasking_main;
