package Traffic_Light is
   -- Define the possible states of the traffic light
   type State_Type is (Red, Green, Yellow);

   -- Define an interface to simulate transitions between states
   procedure Next_State(Current_State : in out State_Type);
end Traffic_Light;

package body Traffic_Light is
   procedure Next_State(Current_State : in out State_Type) is
   begin
      -- Get the current position of the state (as an integer)
      declare
         Current_Pos : Natural := State_Type'Pos(Current_State);  -- Convert enum to integer
      begin
         -- Increment the position and use modulo to wrap around
         Current_Pos := (Current_Pos + 1) mod State_Type'Pos(State_Type'Last) + 1;

         -- Update the state based on the new position
         Current_State := State_Type'Val(Current_Pos);

         -- Print the new state
         case Current_State is
            when Red =>
               Put_Line("Changing state to: Red (Stop)");
            when Green =>
               Put_Line("Changing state to: Green (Go)");
            when Yellow =>
               Put_Line("Changing state to: Yellow (Prepare to Stop)");
         end case;
      end;
   end Next_State;
end Traffic_Light;

with MicroBit.MotorDriver; use MicroBit.MotorDriver; --using the procedures defined here
with DFR0548;  -- using the types defined here
with HAL;

with Traffic_Light;

with MicroBit.Ultrasonic;
with MicroBit.Types; use MicroBit.Types;

with MicroBit.Buttons; use MicroBit.Buttons;

with MicroBit.Console; use MicroBit.Console; -- for serial port communication
use MicroBit; --for pin names



procedure Main is

   --   package sensor3 is new Ultrasonic(MB_P13, MB_P12);
   --   Distance : Distance_cm := 0;
   --  My_UInt12_Value : HAL.UInt12;



begin
   --  MotorDriver.Servo(1,90);
   --  delay 1.0; -- equivalent of Time.Sleep(1000) = 1 second


      --   -- Convert Distance to UInt12 safely (assuming Distance is a Float)
      --        -- Convert Distance_cm to UInt12 directly, ensuring it's in range
      --       My_UInt12_Value := HAL.UInt12(Distance*10);  -- Direct conversion to UInt12

      --   Put_Line ("Right: " & Distance_cm'Image(Distance));
      --   MotorDriver.Drive(Forward,(My_UInt12_Value,My_UInt12_Value,My_UInt12_Value,My_UInt12_Value)); --right front wheel to M4
   loop
    if MicroBit.Buttons.State (Button_A) = Pressed then
         Put_Line ("Pressed A");
    end if;

   end loop;
end Main;
