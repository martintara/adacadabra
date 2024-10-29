-- shared_data.ads
package Shared_Data is

   -- Enumeration defining possible states
   type State_Type is (Move_Forward, Idle);

   -- Protected type to manage the state safely
   protected type State_Manager is
      -- Function to get the current state
      function Get_State return State_Type;

      -- Procedure to set the state to Move_Forward
      procedure Set_Move_Forward;

      -- Procedure to set the state to Idle
      procedure Set_Idle;

   private
      -- Internal state variable, initialized to Idle
      Current_State : State_Type := Idle;
   end State_Manager;

end Shared_Data;
