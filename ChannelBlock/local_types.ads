package Local_Types is

   type Float32 is digits 6;
   for Float32'Size use 32;

   type Uint32 is mod 2 ** 32;
   for Uint32'Size use 32;

   type Int32 is range -16#8000_0000# .. 16#7FFF_FFFF#;

end Local_Types;
