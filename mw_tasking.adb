with System;
with System.Address_Image;
with Local_Types; use Local_Types;
with Ada.Text_IO; use Ada.Text_IO;
with Spmw; use Spmw;

package body Mw_Tasking is

   task body Simple_Task is

  --    Local_Num : Integer;
      Status : Spmw.Mw_Status_T;
      Alloc_Status : Spmw.Mw_Status_T;

      Message_Address : System.Address;
      Msg_Nbytes : Int32 ; --:= Integer'Size/8;
      Msg_Id     : Int32;

   begin

      -- block until started with call to begin_looping

      accept Begin_Looping do
       declare
          tempVar : Integer;
         begin
          tempVar := 0;
         end;

       Msg_Nbytes := Integer'Size/8;


      end;

      loop

         select
            accept Start(Num : in Integer) do

               --Put_Line("Start accepted");

               Spmw.Mw_Mem_Alloc(Memory_Area => Mw_Ram,
                                 Memory_Address => Message_Address,
                                 N_Bytes => Msg_Nbytes,
                                 Alignment => 1,
                                 Status => Alloc_status);

               declare

                  Output_Message : Integer;
                  for Output_Message'Address use Message_Address;

               begin

                  Msg_Id := 5;

                  Output_Message := 2345;

                  Status := Spmw.Mw_Msg_Send(Spmw.Channel_A,
                                             Message_Address,
                                             Msg_Nbytes,
                                             Msg_Id);
               end;

     --          Local_Num := Num;

               Status := Spmw.Mw_Msg_Free(Message_Address);

            end Start;

         or

            accept Report(Num : out Integer) do

               declare
                  Bytes_Read : Int32;
                  Message_Id : Int32;
                  Read_Status : Mw_Status_T;
                  Message_Address : System.Address;

               begin

                  Mw_Msg_Receive(Spmw.Channel_A,
                                 Message_Address,
                                 Bytes_Read,
                                 Message_Id,
                                 Read_Status);

                  --Put_Line("Report, Address Received: " & System.Address_Image(Message_Address));

                  ----Put_Line("Message_Id read from channel_A, " & Int32'Image(Message_Id));

                  Num := Integer(Message_Id);

                  declare
                     Received_Message : Integer;
                     for Received_Message'Address use Message_Address;
                  begin

                     Put_Line("Received_Message: " & Integer'Image(Received_Message));
         --            Put_Line("Report, message address: " & System.Address_Image(Received_Message'address));

                  end;

               end;

            end Report;

         or
            accept CleanUp do

               Put_Line("CleanUp");

            end CleanUp;

         end select;

         --Put_Line("select complete");

      end loop;

   end Simple_Task;

end Mw_Tasking;
