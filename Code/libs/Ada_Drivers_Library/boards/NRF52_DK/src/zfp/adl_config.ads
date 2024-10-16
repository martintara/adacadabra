--  This package was generated by the Ada_Drivers_Library project wizard script
package ADL_Config is
   Architecture                   : constant String  := "ARM";               -- From board definition
   Board                          : constant String  := "NRF52_DK";          -- From command line
   Boot_Memory                    : constant String  := "flash";             -- From default value
   CPU_Core                       : constant String  := "ARM Cortex-M4F";    -- From mcu definition
   Device_Family                  : constant String  := "nRF52";             -- From board definition
   Device_Name                    : constant String  := "nRF52832xxAA";      -- From board definition
   Has_Custom_Memory_Area_1       : constant Boolean := False;               -- From default value
   Has_Ravenscar_Full_Runtime     : constant String  := "False";             -- From board definition
   Has_Ravenscar_SFP_Runtime      : constant String  := "False";             -- From board definition
   Has_ZFP_Runtime                : constant String  := "True";              -- From board definition
   Max_Mount_Name_Length          : constant         := 128;                 -- From default value
   Max_Mount_Points               : constant         := 2;                   -- From default value
   Max_Path_Length                : constant         := 1024;                -- From default value
   Number_Of_Interrupts           : constant         := 128;                 -- From MCU definition
   Runtime_Name                   : constant String  := "zfp-cortex-m4f";    -- From default value
   Runtime_Name_Suffix            : constant String  := "cortex-m4f";        -- From board definition
   Runtime_Profile                : constant String  := "zfp";               -- From command line
   Use_Startup_Gen                : constant Boolean := True;                -- From command line
   Vendor                         : constant String  := "Nordic";            -- From board definition
end ADL_Config;
