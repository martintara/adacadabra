with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MicroBit.Servos; use MicroBit.Servos;
with MicroBit.Ultrasonic;
with MicroBit.Types; use MicroBit.Types;
with LSM303AGR; use LSM303AGR;
with MicroBit.Accelerometer;
with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.Real_Time; use Ada.Real_Time;
with DFR0548;
with MicroBit.Console; use MicroBit.Console;
with HAL; use HAL;
with tasklist;
use MicroBit;

procedure Main with Priority => 0 is
   procedure servo_test is
      ServoPin : Servo_Pin_Id := 1;
      package sensor1 is new Ultrasonic(MB_P13, MB_P12);
      Distance : Distance_cm := 0;
      Ang : Float := 0.0;
   begin
      Distance := sensor1.Read;
      Ang := Float(Distance) / 2.22222222;
      Go(ServoPin, Servo_Set_Point(Ang));
   end servo_test;

   procedure sensor_test is
      package sensor1 is new Ultrasonic(MB_P13, MB_P12);
      Distance : Distance_cm := 0;
      Spd : UInt12 := 0;
   begin
      Distance := sensor1.Read;
      Spd := 20 * UInt12(Distance);
      if Spd = 0 then
         Spd := 4095;
      elsif Spd < 300 then
         Spd := 0;
      end if;
      Put_Line("sensor: " & UInt12'Image(Spd));
      MotorDriver.Drive(Forward, (Spd, Spd, Spd, Spd));
      delay 1.0;
   end sensor_test;

   procedure circle_test is
      Time : Float := 0.0;
      SinSpeed : Float := 0.0;
      CosSpeed : Float := 0.0;
      Quadrant : Directions := Forward;
      SinW : UInt12 := 0;
      CosW : UInt12 := 0;
   begin
      loop
         Time := Time + 0.001;
         SinSpeed := Sin(Time) * 4095.0;
         CosSpeed := Cos(Time) * 4095.0;
         if SinSpeed < 0.0 then
            if CosSpeed < 0.0 then
               Quadrant := Backward;
            else
               Quadrant := Right;
            end if;
         else
            if CosSpeed < 0.0 then
               Quadrant := Left;
            else
               Quadrant := Forward;
            end if;
         end if;
         --Put_Line(UInt12'Image(SinSpeed) & ", " & UInt12'Image(CosSpeed));
         SinW := UInt12(Float'Floor(abs(SinSpeed)));
         CosW := UInt12(Float'Floor(abs(CosSpeed)));
         MotorDriver.Drive(Quadrant, (SinW, CosW, CosW, SinW));
         delay 0.001;
      end loop;
   end circle_test;

   procedure direction_test is
   begin
      MotorDriver.Drive(Forward, (4095,4095,4095,4095));
      delay 2.0;
      MotorDriver.Drive(Backward, (4095,4095,4095,4095));
      delay 2.0;
      MotorDriver.Drive(Left, (4095,4095,4095,4095));
      delay 2.0;
      MotorDriver.Drive(Right, (4095,4095,4095,4095));
      delay 2.0;
      MotorDriver.Drive(Forward_Left, (4095,4095,4095,4095));
      delay 2.0;
      MotorDriver.Drive(Backward_Left, (4095,4095,4095,4095));
      delay 2.0;
      MotorDriver.Drive(Turning, (4095,4095,4095,4095));
      delay 2.0;
      MotorDriver.Drive(Lateral_Left, (4095,4095,4095,4095));
      delay 2.0;
      MotorDriver.Drive(Rotating_Left, (4095,4095,4095,4095));
      delay 2.0;
      MotorDriver.Drive(Stop, (4095,4095,4095,4095));
      delay 20.0;
   end direction_test;

   procedure compass_test is
      Data : All_Axes_Data;
   begin
      Data := Accelerometer.MagData;
      Put_Line ("MAG;" & "X," & Data.X'Img & ";" & "Y,"  & Data.Y'Img & ";" & "Z,"  & Data.Z'Img);
      delay 0.5;
   end compass_test;

   procedure wheel_test is
   begin
      MotorDriver.Drive(Forward, (4095,0,0,0));
      delay 1.0;
      MotorDriver.Drive(Stop, (0,0,0,0));
      delay 1.0;
      MotorDriver.Drive(Forward, (0,4095,0,0));
      delay 1.0;
      MotorDriver.Drive(Stop, (0,0,0,0));
      delay 1.0;
      MotorDriver.Drive(Forward, (0,0,4095,0));
      delay 1.0;
      MotorDriver.Drive(Stop, (0,0,0,0));
      delay 1.0;
      MotorDriver.Drive(Forward, (0,0,0,4095));
      delay 1.0;
      MotorDriver.Drive(Stop, (0,0,0,0));
      delay 1.0;
   end wheel_test;

   procedure turning_test is
      procedure turn is
      Deg_90 : constant Duration := 0.7964;
      begin
         -- 1 sec delay is approx 113 degrees
         -- which implies that 0.7964 is approx 90 degrees
         MotorDriver.Drive(Rotating_Left, (4095, 4095, 4095, 4095));
         delay Deg_90;
         MotorDriver.Drive(Stop, (0,0,0,0));
         delay 1.0;
         MotorDriver.Drive(Rotating_Right, (4095,4095,4095,4095));
         delay Deg_90;
         MotorDriver.Drive(Stop, (0,0,0,0));
      end turn;
   begin
      loop
         turn;
         delay 10.0;
      end loop;
   end turning_test;

   procedure square_test is
   begin
      MotorDriver.Drive(Forward, (4095,4095,4095,4095));
      delay 2.0;
      MotorDriver.Drive(Right, (4095,4095,4095,4095));
      delay 2.0;
      MotorDriver.Drive(Backward, (4095,4095,4095,4095));
      delay 2.0;
      MotorDriver.Drive(Left, (4095,4095,4095,4095));
      delay 2.0;
   end square_test;

   procedure heartbeat is
      timer : Time;
   begin
      timer := Clock;
      Put_Line("thump");
      delay until timer + Seconds(2);
   end heartbeat;
begin
   Put_Line("Starting main loop.");
   loop
      null;
   end loop;
end Main;
