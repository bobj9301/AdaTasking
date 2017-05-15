
with Ada.Text_IO; use Ada.Text_IO;

package body Load_Control is

   protected body Load_Manager is

      entry Wait_Until_Load_Less_Than(Threshold : in Load_Type)
      when not Retrying is

      begin

         if Current_Load > Threshold then

            requeue Wait_To_Retry;

         end if;

      end Wait_Until_Load_Less_Than;
------------------------------------------------------------------------
      procedure Set_Load(Load : in Load_Type) is
      begin

         Current_Load := Load;
         Retrying := True;

      end Set_Load;
------------------------------------------------------------------------
      entry Wait_To_Retry(Load : in Load_Type)
      when Retrying is

      begin

         if Wait_To_Retry'Count = 0 then

            Retrying := False;

         end if;

         requeue Wait_Until_Load_Less_Than;

      end Wait_To_Retry;
------------------------------------------------------------------------
   end Load_Manager;

end Load_Control;
