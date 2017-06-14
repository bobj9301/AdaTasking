with System;
with System.Address_Image;
with Ada.Text_IO; use Ada.Text_IO;

separate (Gmw)

function Mw_Msg_Send(Chan_Id    : in Chan_Id_T;
                     Msg_Address: in System.Address;
                     N_Bytes    : in Int32;
                     Message_Id : in Int32) return Mw_Status_T is

begin

   Put_Line("Mw_Msg_Send called");

   Channel_Manager.Write_Request(Chan_Id)(Chan_Id, Msg_Address, N_Bytes, Message_Id);

   return(Mw_Ok);

end Mw_Msg_Send;

