with MicroBit.Types; use MicroBit.Types;
with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;

package protectedobjects is
   protected type ProtObjs is
      function GetFRAvg return Float;
      function GetFLAvg return Float;
      function GetBAvg return Float;
      function GetDir return Directions;
      function GetSenseTime return Time_Span;
      function GetThinkTime return Time_Span;
      function GetActTime return Time_Span;

      procedure SetFRAvg(F : Float);
      procedure SetFLAvg(F : Float);
      procedure SetBAvg(F : Float);
      procedure SetDir(D : Directions);
      procedure SetSenseTime(D : Time_Span);
      procedure SetThinkTime(D : Time_Span);
      procedure SetActTime(D : Time_Span);
   private
      FRAvg : Float := 0.0;
      FLAvg : Float := 0.0;
      BAvg : Float := 0.0;
      Dir : Directions := Stop;
      SenseTime : Time_Span := Milliseconds(0);
      ThinkTime : Time_Span := Milliseconds(0);
      ActTime : Time_Span := Milliseconds(0);

   end ProtObjs;

   Shared_Data : ProtObjs;
end protectedobjects;
