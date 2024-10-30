with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.Types; use MicroBit.Types;
with protectedobjects; use protectedobjects;

package body think is
   task body thinktask is
      aclock : Time;
      FLReading : Distance_cm;
      FRReading : Distance_cm;
      BReading : Distance_cm;
   begin
      Put_Line("Started thinking task.");
      loop
         aclock := Clock;
         FLReading := Shared_Data.GetFLSensor;
         FRReading := Shared_Data.GetFRSensor;
         BReading := Shared_Data.GetBSensor;
         Put_Line("FLS: " & Distance_cm'Image(FLReading));
         Put_Line("FRS: " & Distance_cm'Image(FRReading));
         Put_Line("BS: " & Distance_cm'Image(BReading));
         delay until aclock + Seconds(3);
      end loop;
   end thinktask;
end think;
