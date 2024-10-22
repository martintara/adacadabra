-- Shared_Data.adb
-- Implementation of the protected object

package body Shared_Data is

   protected body Shared_State is
      procedure Set_State (S : Robot_State) is
      begin
         Current_State := S;
      end Set_State;

      function Get_State return Robot_State is
      begin
         return Current_State;
      end Get_State;

      procedure Set_Sensor_Reading (Value : Boolean) is
      begin
         Obstacle_Detected := Value;
      end Set_Sensor_Reading;

      function Get_Sensor_Reading return Boolean is
      begin
         return Obstacle_Detected;
      end Get_Sensor_Reading;
   end Shared_State;

end Shared_Data;
