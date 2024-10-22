-- Shared_Data.ads
-- Specification of the protected object to manage the shared data

package Shared_Data is
   -- Define the robot's states
   type Robot_State is (Idle, Move_Forward, Turn_Left, Turn_Right);

   -- Protected object to manage shared data between tasks
   protected Shared_State is
      -- Shared state that tasks will access and update
      procedure Set_State (S : Robot_State);
      function Get_State return Robot_State;

      -- Sensor data (example, replace it with real sensor data)
      procedure Set_Sensor_Reading (Value : Boolean);
      function Get_Sensor_Reading return Boolean;
   private
      -- Variables holding the shared state and sensor reading
      Current_State : Robot_State := Idle;
      Obstacle_Detected : Boolean := False;
   end Shared_State;

end Shared_Data;
