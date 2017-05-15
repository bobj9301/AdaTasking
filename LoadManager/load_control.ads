with Ada.Text_IO; use Ada.Text_IO;

package Load_Control is

   subtype Load_Type is Integer range 0..5;

   protected Load_Manager is

      entry Wait_Until_Load_Less_Than(Threshold : in Load_Type);
      procedure Set_Load(Load : in Load_Type);

   private

      Current_Load : Load_Type := 5;
      Retrying     : Boolean := False;

      entry Wait_To_Retry(Load : in Load_Type);

   end Load_Manager;

end Load_Control;
