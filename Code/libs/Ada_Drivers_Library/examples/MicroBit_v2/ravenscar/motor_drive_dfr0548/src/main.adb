with MicroBit.MotorDriver; use MicroBit.MotorDriver; --using the procedures defined here
with DFR0548;  -- using the types defined here
with MicroBit.Servos;  use MicroBit.Servos;
with MicroBit.Buttons; use MicroBit.Buttons;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;



with MicroBit.Console; use MicroBit.Console; -- for serial port communication
use MicroBit; --for pin names

procedure Main is

   subtype Servo_Pin_Id is Pin_Id range 1 .. 2;
   -- create a Servo_Pin_Array struct with embedded function Active to set the target angle of rotation
   type Servo_Pin_State (Active : Boolean := False) is record
      case Active is
         when True =>
            Setpoint : Servo_Set_Point;
         when False =>
            null;
      end case;
   end record;
   type Servo_Pin_Array is array (Servo_Pin_Id) of Servo_Pin_State;

   -- initialize all servo pins to have no PWM signal.
   Servo_Pins : Servo_Pin_Array := (others => (Active => False));

begin
   loop
      --  For all servo pins
      for J in Servo_Pins'Range loop

         -- If the servo is activated
         if Servo_Pins (J).Active then

            -- Library call to microbit-servos to set the duty cycle on a pin. Compare with the analog out example!
            Go (J, Servo_Pins (J).Setpoint);
         else
            -- Library call to microbit-servos to set the duty cycle to zero.
            Stop (J);

         end if;
      end loop;



      -- DEMONSTRATION ROUTINE 4 MOTORS (useful for checking your wiring)
      MotorDriver.Drive(Rotating_Left,(4095,4095,4095,4095)); --right front wheel to M4
      Console.Put_Line("RF");
      delay 1.0;
      MotorDriver.Drive(Stop);
      delay 1.0;
      if State (Button_A) = Pressed and then State (Button_B) = Pressed then
         Servo_Pins := (others => (Active => False));

         -- If button A is pressed, activate both and let them rotate opposite of eachother
      elsif State (Button_A) = Pressed then
         Servo_Pins :=
           (1 => (Active => True, Setpoint => 0),
            2 => (Active => True, Setpoint => 180));
         -- If button B is pressed, activate both and let them rotate opposite of eachother
      elsif State (Button_B) = Pressed then
         Servo_Pins :=
           (1 => (Active => True, Setpoint => 180),
            2 => (Active => True, Setpoint => 0));
      end if;

      end loop;
end Main;
