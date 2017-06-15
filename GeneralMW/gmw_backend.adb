with System;
with System.Storage_Elements;
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Exceptions;
with Local_Types; use Local_Types;

package body Gmw_Backend is

   protected body Channel_Type is

      entry Write(In_Addr : in System.Address;
                  In_Len  : in Int32;
                  In_Id   : in Int32) when Count < (Channel_Pool_Size - 1) is
      begin

         Put_Line("Write started");

         Pool(Next_In).Data_Address := In_Addr;
         Pool(Next_In).Msg_Id := In_Id;
         Pool(Next_In).Length := In_Len;
         Pool(Next_In).Msg_Count := Count;

         Count := Count + 1;
         Next_In := Next_In + 1;

      end Write;


      entry Read(Out_Addr : out System.Address;
                     Out_Len  : out Int32;
                     Out_Id   : out Int32) when Count > 0 is

      begin

         Put_Line("Read Started");

         Out_Addr := Pool(Next_Out).Data_Address;
         Out_Len  := Pool(Next_Out).Length;
         Out_Id   := Pool(Next_Out).Msg_Id;

         Next_Out := Next_Out + 1;
         Count := Count - 1;

      end Read;

   end Channel_Type;

end Gmw_Backend;

