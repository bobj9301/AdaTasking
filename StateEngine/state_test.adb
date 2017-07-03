with Ada.Text_Io;
use Ada.Text_Io;

with State_Engine;
use State_Engine;

procedure state_test is

   Current_State   : State_Engine.State_ID_T := State_Engine.State_ID_C;
   Next_State : State_Engine.State_ID_T;

begin

   Next_State := State_A(Current_State);
   Put_Line("next_state: " & State_Engine.State_ID_T'Image(Next_State));

end State_test;
