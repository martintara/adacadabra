with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with Microbit.Types; use Microbit.Types;

package body act is
   task body acttask is
      timer : Time;
   begin
      Put_Line("Started acting task.");
      loop
         timer := Clock;
         delay until timer + Seconds(2);
      end loop;
   end acttask;
end act;
