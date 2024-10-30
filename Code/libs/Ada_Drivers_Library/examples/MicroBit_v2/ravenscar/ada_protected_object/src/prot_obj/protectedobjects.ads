with MicroBit.Types; use MicroBit.Types;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;

package protectedobjects is
   protected type ProtObjs is
      function GetFRSensor return Distance_cm;
      function GetFLSensor return Distance_cm;
      function GetBSensor return Distance_cm;
      function GetDir return Directions;

      procedure SetFRSensor(D : Distance_cm);
      procedure SetFLSensor(D : Distance_cm);
      procedure SetBSensor(D : Distance_cm);
      procedure SetDir(D : Directions);
   private
      FRSensor : Distance_cm := 0;
      FLSensor : Distance_cm := 0;
      BSensor : Distance_cm := 0;
      Dir : Directions := Stop;

   end ProtObjs;

   Shared_Data : ProtObjs;
end protectedobjects;
