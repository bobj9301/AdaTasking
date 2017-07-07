with Ada.Text_Io;
use Ada.Text_Io;

with State;
use State;

procedure state_only is

   Current_State   : State.State_ID_T := State.State_ID_C;

--   function state_a is new Generic_State(State_Routine => State_A_Routine);

   State_Info : access Static_Info_T;

begin

   State_Info := Create_State;
--   current_state := State_A;


end State_only;
