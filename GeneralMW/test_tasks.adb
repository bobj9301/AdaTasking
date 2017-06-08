with Ada.Text_IO; use Ada.Text_IO;

package body Test_Tasks is

   task body Initializer_Task is separate;
   task body Incrementer_Task is separate;
   task body Square_Task is separate;

end Test_Tasks;
