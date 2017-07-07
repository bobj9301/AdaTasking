package devices is

type Device is tagged private;

type device_type is access device;

function Gen_Fun_A(This : in Device_Type) return Integer;
function Gen_Fun_B(This : in Device_Type) return Integer;


function create(major : integer;
                minor : integer) return device_type;

function major(this : device_type) return integer;
function minor(this : device_type) return integer;

generic
   with function Gen_Function(This : Device_Type) return Integer;
function Execute(This : Device_Type) return Integer;



private
type device is tagged
record
   major : integer;
   minor : integer;
end record;

end devices;
