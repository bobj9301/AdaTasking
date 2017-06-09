with System;
with System.Address_Image;
with Ada.Text_IO; use Ada.Text_IO;
with Local_Types; use Local_Types;

separate (Gmw)

procedure Mw_Msg_Alloc(Chan_Id     : in     Chan_Id_T;
                       Msg_Address : in out System.Address;
                       N_Bytes     : in     Int32;
                       Status      : in out Mw_Status_T) is

   Block_Access : Block_Access_Type := new Block_Type(1..Integer(N_Bytes));

begin

   Put_Line("Mw_Msg_Alloc called");

   Block_Access.all := (others => 0);
   Msg_Address := Block_Access.all'Address;

   Status := Mw_Ok;

end Mw_Msg_Alloc;

