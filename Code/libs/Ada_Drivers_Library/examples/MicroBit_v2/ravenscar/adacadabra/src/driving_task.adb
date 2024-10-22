-- Driving_Task.adb
-- Implementation of the Driving task

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;
with Shared_Data;

package body Driving_Task is

   task body Driving is
   begin
      loop
         -- Get the current state from the protected object
         case Shared_Data.Shared_State.Get_State is
            when Shared_Data.Robot_State.Idle =>
               Put_Line ("State: Idle");
               -- Add code to stop motors here

            when Shared_Data.Robot_State.Move_Forward =>
               Put_Line ("State: Move_Forward");
               -- Add code to drive forward here

            when Shared_Data.Robot_State.Turn_Left =>
               Put_Line ("State: Turn_Left");
               -- Add code to turn left here

            when Shared_Data.Robot_State.Turn_Right =>
               Put_Line ("State: Turn_Right");
               -- Add code to turn right here
         end case;

         -- Simulate motor driving update rate (e.g., every 50ms)
         delay until Clock + Milliseconds(50);
      end loop;
   end Driving;

end Driving_Task;
