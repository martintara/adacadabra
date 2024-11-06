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
         FLReading := Integer(Shared_Data.GetFLAvg);
         FRReading := Integer(Shared_Data.GetFRAvg);
         BReading := Integer(Shared_Data.GetBAvg);
         Put_Line("FLS: " & Integer'Image(FLReading));
         Put_Line("FRS: " & Integer'Image(FRReading));
         Put_Line("BS: " & Integer'Image(BReading));
         cpu_time := Clock - timer;
         Shared_Data.SetThinkTime(cpu_time);
         delay until timer + Milliseconds(600);
      end loop;
   end thinktask;
end think;
