with Integrands;

package Some_Functions is

   type Sin_Type is new Integrands.Functions with null record;
   function F(Selector : Sin_Type;
              X        : Float) return Float;


   type Ramp_Type is new Integrands.Functions with
      record
         A : Float;
         B : Float;
      end record;

   function F(Selector : Ramp_Type;
              X        : Float) return Float;

end Some_Functions;
