with Ada.Text_Io;
use Ada.Text_Io;

with devices;
use devices;

procedure state_only is

   device_a : devices.device_type := devices.create(Major => 10, Minor => 11);
   Device_B : Devices.Device_Type := Devices.Create(Major => 15, Minor => 40);

   major_no : integer;

begin

   Major_No := Devices.Execute(Gen_Function => Gen_Fun_A(This=> Device_a));

   major_no := devices.major(device_a);
   Put_Line("device a major: " & Integer'Image(Major_No));

   Major_No := Devices.Major(Device_B);
   Put_Line("device b major: " & Integer'Image(Major_No));

   major_no := devices.major(device_a);
   Put_Line("device a major: " & Integer'Image(Major_No));

end State_only;
