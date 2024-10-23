with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;

package body think is
   task body thinktask is
      aclock : Time;
   begin
      loop
         aclock := Clock;
         Put_Line("thinking...");
         delay(5.0);
         Put_Line("thought.");
         delay until aclock + Seconds(7);
      end loop;
   end thinktask;
end think;
