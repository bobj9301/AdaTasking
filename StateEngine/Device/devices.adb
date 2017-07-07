package body devices is


function major(this : in device_type) return integer is

begin

return(this.major);

end major;

function minor(this : in device_type) return integer is

begin

return(this.minor);

end minor;

function create(Major : integer;
                minor : integer) return device_type is

newDevice : device_type;

begin

 newDevice := new Device'(Major => Major, Minor=> Minor);

return (newDevice);

end create;

function Execute(This : in Device_Type) return Integer is
   Retval : Integer;
begin
   Retval := Gen_Function(This);
   return(Retval);
end execute;

function Gen_Fun_a(this : in device_type) return integer is

begin

return(this.major);

end Gen_Fun_A;

function Gen_Fun_B(this : in device_type) return integer is

begin

return(this.major);

end Gen_Fun_B;

end devices;
