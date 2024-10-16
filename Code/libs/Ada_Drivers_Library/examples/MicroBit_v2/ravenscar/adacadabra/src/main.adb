with MicroBit.Console; use MicroBit.Console;
with MicroBit.Buttons; use MicroBit.Buttons;
use MicroBit;

procedure Main is
begin
   loop
      -- this example has 3 buttons that are all software debounced, meaning that when a press event is detected a timer is set to ignore interrupts of more btn press events.
      if MicroBit.Buttons.State (Button_A) = Pressed then
         Put_Line ("Pressed A");
      elsif MicroBit.Buttons.State (Button_B) = Pressed then
         Put_Line ("Pressed B");

      -- note that the touch logo is a bit finicky, it is not a clean signal as with the buttons.
   end loop;
end Main;
