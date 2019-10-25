:::::::::::::::::::::::::::::::::
::          FrostFyr3          ::
:::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::
:: Uses DISM Tool to check and repair System Files.
:: Deletes Both Temp Folders, Recents Files, Temp Internet Files, Cookies.
:: Deletes Prefetch Files.
:: Runs Disk Cleanup.
:: Clears Windows DNS Resolver Cache.
:: Runs Disk Defrag Utility.
:::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: DISM Tool System File Repair.
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth

:: SFC System File Repair.
"%windir%\system32\sfc.exe" /scannow

:: Disk Cleanup Utility.
"%windir%\system32\cleanmgr.exe" /sageset:65535
"%windir%\system32\cleanmgr.exe" /sagerun:65535

:: Temp and Prefetch files cleanup.
@echo off    
del /s /f /q %windir%\temp\*.*    
rd /s /q %windir%\temp    
md %windir%\temp    
del /s /f /q %windir%\Prefetch\*.*    
rd /s /q %windir%\Prefetch    
md %windir%\Prefetch    
del /s /f /q %windir%\system32\dllcache\*.*    
rd /s /q %windir%\system32\dllcache    
md %windir%\system32\dllcache    
del /s /f /q "%SysteDrive%\Temp"\*.*    
rd /s /q "%SysteDrive%\Temp"    
::md "%SysteDrive%\Temp"    
del /s /f /q %temp%\*.*
rd /s /q %temp%    
md %temp%    
del /s /f /q "%USERPROFILE%\Local Settings\History"\*.*    
rd /s /q "%USERPROFILE%\Local Settings\History"    
:: md "%USERPROFILE%\Local Settings\History"    
del /s /f /q "%USERPROFILE%\Local Settings\Temporary Internet Files"\*.*    
rd /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files"    
:: md "%USERPROFILE%\Local Settings\Temporary Internet Files"    
del /s /f /q "%USERPROFILE%\Local Settings\Temp"\*.*    
rd /s /q "%USERPROFILE%\Local Settings\Temp"    
:: md "%USERPROFILE%\Local Settings\Temp"    
del /s /f /q "%USERPROFILE%\Recent"\*.*    
rd /s /q "%USERPROFILE%\Recent"    
:: md "%USERPROFILE%\Recent"    
del /s /f /q "%USERPROFILE%\Cookies"\*.*    
rd /s /q "%USERPROFILE%\Cookies"    
:: md "%USERPROFILE%\Cookies"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Brwser Cache Cleanup. [Remove the Colons from Whichever browser you use and leave the rest unchanged.]

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Clears Google Chrome Cache.
:: rd /s /q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache"    
:: md "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache"

:: Clears Brave Browser Cache.
:: rd /s /q "%USERPROFILE%\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\Cache" 
:: md "%USERPROFILE%\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\Cache"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Clears Windows DNS Resolver Cache.
ipconfig /flushdns

:: Opens Disk Defrag Utility.
dfrgui.exe

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::