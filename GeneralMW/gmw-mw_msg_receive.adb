with System;
with System.Address_Image;
with Ada.Text_IO; use Ada.Text_IO;

separate (Gmw)

procedure Mw_Msg_Receive(Chan_Id     : in      Chan_Id_T;
                         Msg_Address :     out System.Address;
                         N_bytes     :     out Int32;
                         Message_Id  :     out Int32;
                         Status      :     out Mw_Status_T) is


begin

   Put_Line("Mw_Msg_Receive called");

end Mw_Msg_Receive;

