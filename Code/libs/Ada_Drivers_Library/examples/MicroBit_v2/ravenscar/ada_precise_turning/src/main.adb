with MicroBit.MotorDriver; use MicroBit.MotorDriver;
use MicroBit;

procedure Main with Priority => 0 is

begin
   loop
      -- 1 sec delay is approx 113 degrees
      -- which implies that 0.7964 is approx 90 degrees
      -- Rotating_Left might be broken in this repo
      MotorDriver.Drive(Rotating_Left, (4095, 4095, 4095, 4095));
      delay 0.7964;
      MotorDriver.Drive(Stop, (0,0,0,0));
   end loop;
end Main;
