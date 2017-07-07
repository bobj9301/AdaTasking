with Ada.Text_Io;
with Integrands;
with Some_Functions;

procedure Example is

   procedure Integrate(Selector : Integrands.Functions'Class) is
      Sum : Float := 0.0;

   begin

      for I in 1 .. 100 loop
         Sum := Sum + 0.01 * Integrands.F(Selector, Float(I) / 100.0);
      end loop;

      Ada.Text_Io.Put_Line(Float'Image(Sum));

   end Integrate;


   Do_Sin : Some_Functions.Sin_Type;

   Do_Ramp : Some_Functions.Ramp_Type := (A => 1.0, B => 0.0);

begin

   Ada.Text_Io.Put("integrated sin=");
   Integrate(Do_Sin);
   Ada.Text_Io.Put("integrated ramp=");
   Integrate(Do_Ramp);

end Example;
