with System;
with System.Address_Image;
with Ada.Text_IO; use Ada.Text_IO;

separate (Gmw)

procedure Mw_Mem_Alloc(Memory_Area    : in     Mem_Id_T;
                          Memory_Address :    out System.Address;
                          N_Bytes        : in     Int32;
                          Alignment      : in     Int32;
                          Status         :    out Mw_Status_T) is

begin

   Put_Line("Mw_Mem_Alloc called");

end Mw_Mem_Alloc;

