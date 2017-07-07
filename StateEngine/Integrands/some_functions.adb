with Ada.Numerics.Elementary_Functions;

package body Some_Functions is

   function F(Selector : Sin_Type;
              X        : Float) return Float is
   begin

      return Ada.Numerics.Elementary_Functions.Sin(X);

   end F;

   function F(Selector : Ramp_Type;
              X        : Float) return Float is

   begin

      return Selector.A * X + Selector.B;

   end F;

end Some_Functions;
