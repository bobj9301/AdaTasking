package Integrands is

   type Functions is abstract tagged null record;

   function F(Selector : Functions;
              X        : Float) return Float is abstract;

end integrands;
