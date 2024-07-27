@ECHO OFF
SETLOCAL
rem copies file to local directory to simplify script execution
xcopy "%~dp0Device_Lockout_2.0" "C:\Device_Lockout" /E /H /C /I
timeout /t 5
Rem clears local admin access except users you would like to keep as local admin - Needed for us as we allow fac/staff to be local admins
Powershell.exe -File "C:\Device_Lockout\ClearLocalAdmin.ps1"
timeout /t 5
Rem locks device by importing registry key to fill event log
reg import "C:\Device_Lockout\DeviceLockout1.reg"
timeout /t 5
Rem locks device by importing registry key to set event log to not overwrite and to need manual deletion
reg import "C:\Device_Lockout\DeviceLockout2.reg"
timeout /t 5
Changes login screen that user sees
reg import "C:\Device_Lockout\DeviceLockScreen.reg"
Shutdown /s /t 15 /c "This Device has been reported as lost/stolen and must be returned. Please Contact us to have this device unlocked at" 