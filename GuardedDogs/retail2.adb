with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure retail2 is

   number_of_dogs : integer := 0;

   task five_dogs;
   task remove_five_dogs;

   task retail_hot_dogs is
      entry stock_with_a_hot_dog;
      entry deliver_a_hot_dog;
   end retail_hot_dogs;

   task body retail_hot_dogs is
   begin

      for Index in 1..18 loop
        Put("In loop => ");
        select
          
          when number_of_dogs > 0 =>

              accept deliver_a_hot_dog do

                 number_of_dogs := number_of_dogs - 1;
                 put_line("remove a hot dog from the shelf");

              end deliver_a_hot_dog;
         or

          when Number_Of_Dogs < 8 =>

              accept Stock_with_a_hot_dog do

                 number_of_dogs := number_of_dogs + 1;
                 Put("Add a hot dog to the shelf, number =");
                 Put(Number_Of_Dogs, 3);
                 new_line;

              end stock_with_a_hot_dog;

         end select;

       end loop;

     Put_Line("retail_hot_dogs closed");

    end retail_hot_dogs;

    task body five_dogs is
    begin

      for index in 1..5 loop
        delay 0.1;
        retail_hot_dogs.stock_with_a_hot_dog;
      end loop;
     put_line("five_dogs ending");
    end five_dogs;

    task body remove_five_dogs is
    begin

      for index in 1..5 loop
        delay 0.6;
        retail_hot_dogs.deliver_a_hot_dog;
      end loop;

     put_line("remove dogs closed");
    end remove_five_dogs;

    begin

      for index in 1..4 loop
         delay 0.9;
         Put("main loop: ");
         Put(index, 3);
         new_line;

         retail_hot_dogs.stock_with_a_hot_dog;
         retail_hot_dogs.deliver_a_hot_dog;
      end loop;
  end retail2;
