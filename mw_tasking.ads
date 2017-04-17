with Ada.Text_IO; use Ada.Text_IO;
with Spmw;

package mw_tasking is

task type Simple_Task is
   entry Begin_Looping;
   entry Start(Num  :  in Integer);
   entry Report(Num : out Integer);

end Simple_Task;

type Task_Pool is array(Positive range 1 .. 2) of Simple_Task;

end mw_tasking;
