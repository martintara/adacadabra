with Ada.Real_Time; use Ada.Real_Time;
with tasks;
procedure Main is
begin
   delay until Ada.Real_time.clock + Seconds(60);
end Main;
