-- Driving_Task.adb
-- Implementation of the Driving task

with Ada.Real_Time; use Ada.Real_Time;
--  with Ada.Text_IO; use Ada.Text_IO;
with Shared_Data;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.Buttons; use MicroBit.Buttons;
with Shared_Data;


package body Driving_Task is

   task body Driving is
      Current_State : Shared_Data.Current_State := Shared_Data.Current_State.Idle;
   begin
      loop
         -- Get the current state from State_Manager

         -- Act based on the current state
         case Current_State is
            when Shared_Data.Move_Forward =>
               Put_Line("Moving forward");
            when Shared_Data.Idle =>
               Put_Line("Idle");
         end case;

         -- Delay to avoid busy-waiting; adjust the delay as needed
         delay 0.5;
      end loop;
   end Driving;

end Driving_Task;
