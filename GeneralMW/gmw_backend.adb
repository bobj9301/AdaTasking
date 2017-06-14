with System;
with System.Storage_Elements;
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Exceptions;
with Local_Types; use Local_Types;

package body Gmw_Backend is

   protected body Channel_Type is

      procedure Write(In_Addr : in System.Address;
                  In_Len  : in Int32;
                  In_Id   : in Int32) is
      begin
         Put_Line("Write");

      end Write;

   end Channel_Type;

end Gmw_Backend;

