with Ada.Text_Io;
use Ada.Text_Io;

with mw_tasking;
use mw_tasking;

procedure tasking_main is

   my_pool : Task_Pool;
   Num : Integer;

begin

   Put_Line("starting pool 1");

   My_Pool(1).Begin_Looping;
   my_pool(1).start(1);
--   my_pool(1).report(Num);

   Put_Line("calling pool(2)");

   My_Pool(2).Begin_Looping;
--   My_Pool(2).Start(2);
   My_Pool(2).Report(Num);

   Put_Line("Num: " & Integer'Image(Num));

--   Put_Line ("Hello World");

end tasking_main;
