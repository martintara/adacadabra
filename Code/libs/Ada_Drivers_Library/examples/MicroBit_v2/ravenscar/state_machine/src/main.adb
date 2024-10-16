with MicroBit.Console; use MicroBit.Console; -- for serial port communication
--  with DFR0548;  -- using the types defined here
--  with HAL;

with Traffic_Light;

--  with MicroBit.Ultrasonic;
--  with MicroBit.Types; use MicroBit.Types;

with MicroBit.Buttons; use MicroBit.Buttons;

with Ada.Real_Time; use Ada.Real_Time;

use MicroBit; --for pin names



procedure Main is

   --   package sensor3 is new Ultrasonic(MB_P13, MB_P12);
   --   Distance : Distance_cm := 0;
   --  My_UInt12_Value : HAL.UInt12;
   Current_State : Traffic_Light.State_Type := Traffic_Light.Red;
   Debounce_Delay : constant Duration := 0.1;
   Counter : Integer := 1;

begin
   -- Main loop to handle state changes and continuous counting
   loop
      -- Check if Button_A is pressed outside the state-specific case
      if MicroBit.Buttons.State(Button_A) = Pressed then
         -- Transition to the next state
         Traffic_Light.Next_State(Current_State);
         Counter := 1;  -- Reset counter for the new state
         delay Debounce_Delay;  -- Debounce delay after button press
      end if;

      -- State-based continuous counting
      case Current_State is

         -- State: Red
         when Traffic_Light.Red =>
            Put_Line("Red" & Integer'Image(Counter));
            Counter := Counter + 1;  -- Increment counter

         -- State: Green
         when Traffic_Light.Green =>
            Put_Line("Green" & Integer'Image(Counter));
            Counter := Counter + 1;  -- Increment counter

         -- State: Yellow
         when Traffic_Light.Yellow =>
            Put_Line("Yellow" & Integer'Image(Counter));
            Counter := Counter + 1;  -- Increment counter

      end case;

      -- Small delay to control the speed of counting
      delay Debounce_Delay;
   end loop;

end Main;
