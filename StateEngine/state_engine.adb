with System.Memory;
with System;
with System.Storage_Elements;
with System.Address_To_Access_Conversions;
with Ada.Unchecked_Deallocation;
with Ada.Task_Identification;
with System.Address_Image;

with Ada.Text_Io; use Ada.Text_Io;

package body State_Engine is


   -- ======================================================================================
   -- Define mw handler bodies

--   function Mw_Msg_Send(Chan_Id    : in Chan_Id_T;
--                        Msg_Address: in System.Address;
--                        N_Bytes    : in Int32;
--                        Message_Id : in Int32) return Mw_Status_T is separate;

   function State_A(Current_State : in State_Id_T) return State_Id_T is

      Next_State : State_Id_T := State_ID_B;

   begin

      if (Current_State = State_Engine.State_ID_C) then

         Next_State := State_ID_D;

      end if;

      return(Next_State);

   end State_A;

end State_Engine;
