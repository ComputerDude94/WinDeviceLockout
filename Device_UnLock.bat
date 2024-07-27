@ECHO OFF
SETLOCAL
reg import "%~dp0C:\Device_Lockout\Event_Log_Repair_22H2.reg"
timeout /t 5
reg import "C:\Device_Lockout\Event_Log_Repair_22H2_Policies.reg"
timeout /t 5
Shutdown /s /t 15 /c "This Device has been Unlocked and can be used again. Please Contact us if you run into issues at 610-436-3350" 