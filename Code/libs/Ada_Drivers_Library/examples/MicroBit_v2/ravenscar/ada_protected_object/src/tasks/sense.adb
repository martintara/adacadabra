with Ada.Real_Time; use Ada.Real_Time;
with MicroBit; use MicroBit;
with MicroBit.Types; use MicroBit.Types;
with MicroBit.Console; use MicroBit.Console;
with protectedobjects; use protectedobjects;
with MicroBit.Ultrasonic;

package body sense is
   task body sensetask is
      aclock : Time;
      package FLS is new Ultrasonic(MB_P14, MB_P13);
      package FRS is new Ultrasonic(MB_P12, MB_P8);
      package BS is new Ultrasonic(MB_P16, MB_P15);
   begin
      Put_Line("Started sensing task.");
      loop
         aclock := Clock;
         Shared_Data.SetFLSensor(FLS.Read);
         Shared_Data.SetFRSensor(FRS.Read);
         Shared_Data.SetBSensor(BS.Read);
         --HC-SR04 datasheet suggests a sensor reading interval of 60ms
         delay until aclock + Milliseconds(60);
      end loop;
   end sensetask;
end sense;
