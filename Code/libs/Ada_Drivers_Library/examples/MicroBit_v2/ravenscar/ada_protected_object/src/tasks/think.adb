with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.Types; use MicroBit.Types;
with protectedobjects; use protectedobjects;

package body think is
   task body thinktask is
      aclock : Time;
      FLReading : Integer;
      FRReading : Integer;
      BReading : Integer;
   begin
      Put_Line("Started thinking task.");
      loop
         aclock := Clock;
         FLReading := Integer(Shared_Data.GetFLAvg);
         FRReading := Integer(Shared_Data.GetFRAvg);
         BReading := Integer(Shared_Data.GetBAvg);
         Put_Line("FLS: " & Integer'Image(FLReading));
         Put_Line("FRS: " & Integer'Image(FRReading));
         Put_Line("BS: " & Integer'Image(BReading));
         delay until aclock + Milliseconds(600);
      end loop;
   end thinktask;
end think;
