with System;
with System.Address_Image;
with Ada.Text_IO; use Ada.Text_IO;

separate (Gmw)

function Mw_Msg_Free(Msg_Address : in System.Address) return Mw_Status_T is

begin

   Put_Line("Mw_Msg_Free called");

   return(Mw_Ok);

end Mw_Msg_Free;

