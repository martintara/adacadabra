-- Computing_Task.adb
-- Implementation of the Computing task

with Ada.Real_Time; use Ada.Real_Time;
with Shared_Data;

package body Computing_Task is

   task body Computing is
   begin
      loop
         -- Retrieve sensor data
         if Shared_Data.Shared_State.Get_Sensor_Reading then
            -- If obstacle detected, decide to turn left
            Shared_Data.Shared_State.Set_State(Shared_Data.Robot_State.Turn_Left);
         else
            -- If no obstacle, move forward
            Shared_Data.Shared_State.Set_State(Shared_Data.Robot_State.Move_Forward);
         end if;

         -- Simulate decision-making rate (e.g., every 100ms)
         delay until Clock + Milliseconds(100);
      end loop;
   end Computing;

end Computing_Task;
