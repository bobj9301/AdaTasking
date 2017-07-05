with System.Memory;
with System;
with System.Storage_Elements;
with System.Address_To_Access_Conversions;
with Ada.Unchecked_Deallocation;
with Ada.Task_Identification;
with System.Address_Image;

with Ada.Text_Io; use Ada.Text_Io;

package body State_Engine is

   function State_A_Routine return State_Id_T is

      Next_State : State_Id_T := State_ID_B;

      type Active_States_List_A is (State_ID_A, State_ID_B);
      type Active_MID_Types_A is (MID_A, MID_C);
      type Active_Channels_A is (Channel_A, Channel_B, Channel_D);

   begin

      Put_Line("In state A");

      for I in Active_States_List_A'First .. Active_States_List_A'Last loop
         Put_Line("State : " & Active_States_List_A'Image(I));
      end loop;

      for M in Active_Mid_Types_A'First .. Active_Mid_Types_A'Last loop
         Put_Line("MID : " & Active_Mid_Types_A'Image(M));
      end loop;

      State_Info(State_Id_A).Entry_count := State_Info(State_Id_A).Entry_Count + 1;

      if(State_Info(State_Id_A).Entry_Count > 3) then
         Next_State := End_Processing;
      end if;

      return(Next_State);

   end State_A_Routine;

   function State_B_Routine return State_Id_T is

      Next_State : State_Id_T := State_ID_A;

      type Active_States_List_B is (State_ID_C);
      type Active_MID_Types_B is (MID_B, MID_C);
      type Active_Channels_B is (Channel_B, Channel_D);

   begin

      Put_Line("In State B");
      for I in Active_States_List_B'First .. Active_States_List_B'Last loop
         Put_Line("State : " & Active_States_List_B'Image(I));
      end loop;

      return(Next_State);

   end State_B_Routine;


   function Generic_State return State_Id_T is

      Return_State : State_Id_T;
   begin

      Put_Line("Generic: State_Entry");

      Return_State := State_Routine;
      Put_Line("Generic: State_Exit");

      return(Return_State);

   end Generic_State;

end State_Engine;
