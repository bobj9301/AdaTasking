with System;
with System.Storage_Elements;
with Ada.Exceptions;

package State_Engine is

   -- ======================================================================================
   -- Type Definitions

   type State_id_T is
     (State_ID_A, State_ID_B, State_ID_C, State_ID_D, State_ID_E);

   -- ======================================================================================
   -- Channel Definitions

   function State_A(Current_State : in State_id_T) return State_id_T;
--   function State_B(Current_State : in State_id_T) return State_id_T;
--   function State_C(Current_State : in State_id_T) return State_id_T;
--   function State_D(Current_State : in State_id_T) return State_id_T;


end State_Engine;

