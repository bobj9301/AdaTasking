with Ada.Text_Io;
use Ada.Text_Io;

with mw_tasking;
use mw_tasking;

procedure tasking_main is

   my_pool : Task_Pool;
   Num : Integer;

begin

   my_pool(1).start(1);
   my_pool(1).report(Num);

   Put_Line("Num: " & Integer'Image(Num));

   Put_Line ("Hello World");

end tasking_main;
