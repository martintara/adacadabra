-- Autonomous_Robot.adb
-- Main program body

with Ada.Real_Time; use Ada.Real_Time;

procedure Autonomous_Robot is
begin
   -- The main program simply waits, as all tasks are running concurrently
   delay until Ada.Real_Time.Clock + Seconds(60); -- Run for 60 seconds (or indefinitely in a real system)
end Autonomous_Robot;
