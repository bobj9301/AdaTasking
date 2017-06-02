with Ada.Text_Io;
use Ada.Text_Io;

with mw_tasking;
use mw_tasking;

procedure tasking_main is

   --  my_pool : Task_Pool;
   
   Receiver : Receiver_Task;
   Sender   : Sender_Task;
   Sender_2   : Sender_Task;
   Sender_3   : Sender_Task;
   Sender_4   : Sender_Task;

begin

 --  My_Pool(1).Begin_Looping(1);
 --  My_Pool(2).Begin_Looping(2);

   Receiver.Begin_Looping(1);
   Sender.Begin_Looping(2);
   Sender_2.Begin_Looping(3);
   Sender_3.Begin_Looping(4);
   Sender_4.Begin_Looping(5);
   
   Put_Line("main complete");

end tasking_main;
