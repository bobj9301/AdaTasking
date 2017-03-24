with Ada.Text_IO; use Ada.Text_IO;

package mw_tasking is

task type Simple_Task is

   entry Start(Num  :  in Integer);
   entry Report(Num : out Integer);

end Simple_Task;

type Task_Pool is array(Positive range 1 .. 1) of Simple_Task;

end mw_tasking;
