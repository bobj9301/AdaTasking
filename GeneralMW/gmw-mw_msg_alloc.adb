with System;
with System.Address_Image;
with Ada.Text_IO; use Ada.Text_IO;

separate (Gmw)

procedure Mw_Msg_Alloc(Chan_Id     : in     Chan_Id_T;
                       Msg_Address : in out System.Address;
                       N_Bytes     : in     Int32;
                       Status      : in out Mw_Status_T) is

begin

   Put_Line("Mw_Msg_Alloc called");

end Mw_Msg_Alloc;

