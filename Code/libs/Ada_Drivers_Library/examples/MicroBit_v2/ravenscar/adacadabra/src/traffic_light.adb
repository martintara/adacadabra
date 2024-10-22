with Ada.Text_IO; use Ada.Text_IO;

package body Traffic_Light is

   -- Function to return the current state as a string
   function Get_State (Current_State : State_Type) return String is
   begin
      case Current_State is
         when Red    => return "Red";
         when Green  => return "Green";
         when Yellow => return "Yellow";
      end case;
   end Get_State;

   -- Procedure to move to the next state manually without using 'Succ
   procedure Next_State(Current_State : in out State_Type) is
   begin
      case Current_State is
         when Red =>
            Current_State := Green;  -- Transition from Red to Green
         when Green =>
            Current_State := Yellow;  -- Transition from Green to Yellow
         when Yellow =>
            Current_State := Red;  -- Wrap around from Yellow to Red
      end case;
   end Next_State;

end Traffic_Light;
