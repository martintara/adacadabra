-- shared_data.adb
package body Shared_Data is

   protected body State_Manager is

      -- Function to get the current state
      function Get_State return State_Type is
      begin
         return Current_State;
      end Get_State;

      -- Procedure to set the state to Move_Forward
      procedure Set_Move_Forward is
      begin
         Current_State := Move_Forward;
      end Set_Move_Forward;

      -- Procedure to set the state to Idle
      procedure Set_Idle is
      begin
         Current_State := Idle;
      end Set_Idle;

   end State_Manager;

end Shared_Data;
