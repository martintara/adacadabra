with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;

package body sense is
   task body sensetask is
      aclock : Time;
   begin
      loop
         aclock := Clock;
         Put_Line("sensing...");
         delay(1.0);
         Put_Line("sensed.");
         delay until aclock + Seconds(3);
      end loop;
   end sensetask;
end sense;
