with Ada.Text_Io; use Ada.Text_Io;

package body Block_Defs is

   procedure Finalize(Block : in out Block_Buffer) is
   begin
      Put_Line("finalize block_buffer");
   end;

   procedure Initialize(Block : in out Block_Buffer) is
   begin

      Put_Line("Initialize block_buffer");
   end;

   procedure Adjust(Block : in out Block_Buffer) is
   begin

      Put_Line("adjust block_Buffer");
   end;

   procedure Finalize(Block : in out Block_Buffer_Access_CType) is
   begin
      Put_Line("finalize access ctype");
   end;

   procedure Initialize(Block : in out Block_Buffer_Access_CType) is
   begin

      Put_Line("Initialize access ctype");
   end;

   procedure Adjust(Block : in out Block_Buffer_Access_CType) is
   begin

      Put_Line("adjust access ctype");
   end;
end Block_Defs;
