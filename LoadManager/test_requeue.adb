with Ada.Text_Io; use Ada.Text_Io;
with Load_Control;

procedure Test_Requeue is

   task Load_Monitor;
   task body Load_Monitor is
   begin

      delay 4.0;

      Load_Control.Load_Manager.Set_Load(3);

      delay 2.0;

      Load_Control.Load_Manager.Set_Load(1);

   end Load_Monitor;

   task type Urgent_Task;
   task body Urgent_Task is
   begin

      delay 2.0;
      Put_Line("Urgent_task will get on queue");
      Load_Control.Load_Manager.Wait_Until_Load_Less_Than(4);
      Put_Line("Urgent task completed");

   end Urgent_Task;

   task type Casual_Task;
   task body Casual_Task is
   begin

      Put_Line("Causal task will get on queue");
      Load_Control.Load_Manager.Wait_Until_Load_Less_Than(2);
      Put_Line("Causual task complete");

   end Casual_Task;

------------------------------------------------------------------------

   UT : array(1..2) of Urgent_Task;
   CT : array(1..2) of Casual_Task;

   ------------------------------------------------------------------------

begin

   null;

end Test_Requeue;
