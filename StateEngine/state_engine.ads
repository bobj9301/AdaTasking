with System;
with System.Storage_Elements;
with Ada.Exceptions;

package State_Engine is

   -- ======================================================================================
   -- Type Definitions

   type State_Id_T is
     (State_ID_A, State_ID_B, State_ID_C, State_ID_D, State_ID_E, End_Processing);

   generic
      with function State_Routine return State_Id_T;

   function  Generic_State return State_Id_T;

   -- ======================================================================================
   -- State Definitions

   function State_A_Routine return State_id_T;

   function State_B_Routine return State_id_T;

   type Static_Info_T is
      record
         Entry_Count : Integer := 0;
         Exit_Count : Integer := 0;
      end record;

   State_Info : array (State_Id_T) of Static_Info_T;

end State_Engine;

