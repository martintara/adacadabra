with MicroBit.Console; use MicroBit.Console; -- for serial port communication


with MicroBit.MotorDriver; use MicroBit.MotorDriver; --using the procedures defined here
with DFR0548;  -- using the types defined here
with HAL;

with Traffic_Light;

with MicroBit.Ultrasonic;
with MicroBit.Types; use MicroBit.Types;

with MicroBit.Buttons; use MicroBit.Buttons;

with Ada.Real_Time; use Ada.Real_Time;

use MicroBit; --for pin names



procedure Main is

   --   package sensor3 is new Ultrasonic(MB_P13, MB_P12);
   --   Distance : Distance_cm := 0;
   --  My_UInt12_Value : HAL.UInt12;
   Current_State : Traffic_Light.State_Type := Traffic_Light.Red;
   Delay_Time : constant Duration := 0.5;


begin

loop
      -- Check if Button_A is pressed
      if MicroBit.Buttons.State(Button_A) = Pressed then
         -- Button was pressed, transition to the next state
         Traffic_Light.Next_State(Current_State);

         -- Print the new state
         Put_Line("New state: " & Traffic_Light.Get_State(Current_State));

         -- Add a small delay to debounce the button press
         delay Delay_Time;
      end if;
end loop;

end Main;
