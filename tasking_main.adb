with Ada.Text_Io;
use Ada.Text_Io;

with mw_tasking;
use mw_tasking;
with System;
with Block_Defs;
with Ada.Unchecked_Conversion;

procedure tasking_main is

   my_pool : Task_Pool;
   Num : Integer;

--   Test_Block : Block_Defs.Block_Buffer;

begin

--   declare
--      Test_Block : Block_Defs.Block_Buffer; -- Initialize

--      Test_Block2 : Block_Defs.Block_Buffer_Access_Type; --
--      Test_Block3 : Block_Defs.Block_Buffer_Access_Type; --

--      Test_Acc  : Block_Defs.Block_Buffer_Access_CType; -- Initialize Access
--      Test_Acc2 : Block_Defs.Block_Buffer_Access_CType; -- Initialize Access
--      Test_Addr : System.Address;
--   begin

--      Test_Block2 := new Block_Defs.Block_Buffer; -- initialize
   --   Test_Acc := new Block_Defs.Block_Buffer;
--      Test_Acc2 := Test_Acc;
--      Test_Block3 := Test_Block2; -- Adjust not called
--      Test_Addr := Test_Block2.all'address;
--   end;

   My_Pool(1).Begin_Looping;
   My_Pool(2).Begin_Looping;

   my_pool(1).start(1);
--   My_Pool(1).Start(2);
   My_Pool(2).Report(Num);

   Put_Line("main complete");

end tasking_main;
