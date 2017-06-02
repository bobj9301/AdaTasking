with Ada.Text_IO; use Ada.Text_IO;
with Spmw;

package mw_tasking is

task type Receiver_Task is

   entry Begin_Looping(Task_id: in Integer);

end Receiver_Task;

task type Sender_Task is

   entry Begin_Looping(Task_id: in Integer);

end Sender_Task;


-- type Task_Pool is array(Positive range 1 .. 2) of Simple_Task;

end mw_tasking;
