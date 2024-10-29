package States is
   type State_Type is (Red, Green, Yellow);

   function Get_State (Current_State : State_Type) return String;

   procedure Next_State(Current_State : in out State_Type);
end States;

