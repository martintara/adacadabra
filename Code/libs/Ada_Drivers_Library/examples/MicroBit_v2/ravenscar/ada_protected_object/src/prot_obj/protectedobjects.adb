with MicroBit.Types; use MicroBit.Types;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;

package body protectedobjects is
   protected body ProtObjs is
      function GetFRSensor return Distance_cm is
      begin
         return FRSensor;
      end GetFRSensor;

      function GetFLSensor return Distance_cm is
      begin
         return FLSensor;
      end GetFLSensor;

      function GetBSensor return Distance_cm is
      begin
         return BSensor;
      end GetBSensor;

      function GetDir return Directions is
      begin
         return Dir;
      end GetDir;

      procedure SetFRSensor(D : Distance_cm) is
      begin
         FRSensor := D;
      end SetFRSensor;

      procedure SetFLSensor(D : Distance_cm) is
      begin
         FLSensor := D;
      end SetFLSensor;

      procedure SetBSensor(D : Distance_cm) is
      begin
         BSensor := D;
      end SetBSensor;

      procedure SetDir(D : Directions) is
      begin
         Dir := D;
      end SetDir;
   end ProtObjs;
end protectedobjects;
