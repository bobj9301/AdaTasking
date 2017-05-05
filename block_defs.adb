with Ada.Text_Io; use Ada.Text_Io;
with Local_Types; use Local_Types;

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

      procedure Finalize(Block : in out Block_Control_Type) is
   begin
      Put_Line("finalize block_control_type");
   end;

   procedure Initialize(Block : in out Block_Control_Type) is
   begin

      Put_Line("Initialize block_control_type");
   end;

   procedure Adjust(Block : in out Block_Control_Type) is
   begin

      Put_Line("adjust block_control_type");
   end;

   procedure Set_Block_Size(Block : in out Block_Control_Type;
                            Size : in Int32) is
   begin

      Block.Reference_Count := Block.Reference_Count + 1;
      Block.Data_Ptr := new Block_Type(1..Integer(Size));
      Put_Line("Set_block_size to : " & Int32'Image(Size));
   end;

end Block_Defs;
