with Ada.Text_IO; use Ada.Text_IO;

package Test_Tasks is

   task type Initializer_Task is

      entry Begin_Looping(Task_id: in Integer);

   end Initializer_Task;

   task type Incrementer_Task is

      entry Begin_Looping(Task_Id: in Integer);

   end Incrementer_Task;

   task type Square_Task is

      entry Begin_Looping(Task_Id: in Integer);

   end Square_Task;


end Test_Tasks;
