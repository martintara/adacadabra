-- Sensing_Task.adb
-- Implementation of the Sensing task

with Ada.Real_Time; use Ada.Real_Time;
with Shared_Data;

package body Sensing_Task is

   task body Sensing is
      Sensor_Input : Boolean := False;
   begin
      loop
         -- Simulate reading sensor input (replace with actual sensor code)
         Sensor_Input := False;  -- Simulate no obstacle for now

         -- Store the sensor reading in the protected object
         Shared_Data.Shared_State.Set_Sensor_Reading(Sensor_Input);

         -- Simulate sensing rate (e.g., reading sensors every 200ms)
         delay until Clock + Milliseconds(200);
      end loop;
   end Sensing;

end Sensing_Task;
