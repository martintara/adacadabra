with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with Microbit.Types; use Microbit.Types;
with protectedobjects; use protectedobjects;

package body act is
   task body acttask is
      timer : Time;
      cpu_time : Time_Span;
   begin
      Put_Line("Started acting task.");
      loop
         timer := Clock;
         delay 0.001; --just to simulate some code executing
         cpu_time := Clock - timer;
         Shared_Data.SetActTime(cpu_time);
         delay until timer + Seconds(2);
      end loop;
   end acttask;
end act;
