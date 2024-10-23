with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;

package body act is
   task body acttask is
      aclock : Time;
   begin
      loop
         aclock := Clock;
         Put_Line("acting...");
         delay(10.0);
         Put_Line("acted.");
         delay until aclock + Seconds(15);
      end loop;
   end acttask;
end act;
