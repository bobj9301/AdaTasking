with Ada.Text_Io;
use Ada.Text_Io;

with State_Engine;
use State_Engine;

procedure state_test is

   Current_State   : State_Engine.State_ID_T := State_Engine.State_ID_C;
   Next_State : State_Engine.State_ID_T := State_Engine.State_Id_B;

   function State_A is new Generic_State(State_Routine => State_A_Routine);

   function State_B is new Generic_State(State_Routine => State_B_Routine);

begin

   Current_State := State_ID_A;

   while Next_State /= End_Processing loop

      case Current_State is

         when State_ID_A =>
            Next_State := State_A;

         when State_ID_B =>
            Next_State := State_B;

         when others =>
            Next_State := End_Processing;

      end case;

      Current_State := Next_State;

   end loop;

end State_test;
