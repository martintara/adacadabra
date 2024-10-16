-- traffic_light.ads
package Traffic_Light is
   -- Define the possible states of the traffic light
   type State_Type is (Red, Green, Yellow);

   -- Procedure to get the current state as a string (for printing)
   function Get_State (Current_State : State_Type) return String;

   -- Procedure to transition to the next state
   procedure Next_State(Current_State : in out State_Type);
end Traffic_Light;

