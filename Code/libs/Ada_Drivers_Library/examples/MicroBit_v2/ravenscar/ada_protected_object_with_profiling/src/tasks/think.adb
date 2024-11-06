with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.Types; use MicroBit.Types;
with protectedobjects; use protectedobjects;

package body think is
   task body thinktask is
      timer : Time;
      cpu_time : Time_Span;
      FLReading : Integer;
      FRReading : Integer;
      BReading : Integer;
   begin
      Put_Line("Started thinking task.");
      loop
         timer := Clock;
         FLReading := Integer(Brain.GetFLAvg);
         FRReading := Integer(Brain.GetFRAvg);
         BReading := Integer(Brain.GetBAvg);

         --these aren't interesting for this example and have thus been commented out
         --Put_Line("FLS: " & Integer'Image(FLReading));
         --Put_Line("FRS: " & Integer'Image(FRReading));
         --Put_Line("BS: " & Integer'Image(BReading));

         cpu_time := Clock - timer;
         Brain.SetThinkTime(cpu_time);
         delay until timer + Milliseconds(600);
      end loop;
   end thinktask;
end think;
