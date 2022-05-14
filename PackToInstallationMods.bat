@echo off
setlocal EnableDelayedExpansion

set orig_cwd=%cd%

set thisdir=%~dp0
set thisdir=%thisdir:~0,-1%
cd  %thisdir%

set /p packerdir=<PackerDir.txt

set installedDir=c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods

set pakName=TeamStatusMonitor
rmdir /S /Q "%packerdir%\Input"
mkdir "%packerdir%\Input"
mkdir "%packerdir%\Input\Content"
copy  /Y    "%thisdir%\WindowsNoEditor\FSD\AssetRegistry.bin" "%packerdir%\Input\AssetRegistry.bin"
set subPath=_TeamStatus\_CustomImages
xcopy /Y /S "%thisdir%\WindowsNoEditor\FSD\Content\%subPath%\*" "%packerdir%\Input\Content\%subPath%\"
set subPath=_TeamStatus\_CustomSounds
xcopy /Y /S "%thisdir%\WindowsNoEditor\FSD\Content\%subPath%\*" "%packerdir%\Input\Content\%subPath%\"
set subPath=_TeamStatus\TeamStatusMonitor
xcopy /Y /S "%thisdir%\WindowsNoEditor\FSD\Content\%subPath%\*" "%packerdir%\Input\Content\%subPath%\"
call :PackAndCopy

set pakName=TeamStatusAlertTones
rmdir /S /Q "%packerdir%\Input"
mkdir "%packerdir%\Input"
mkdir "%packerdir%\Input\Content"
copy  /Y    "%thisdir%\WindowsNoEditor\FSD\AssetRegistry.bin" "%packerdir%\Input\AssetRegistry.bin"
set subPath=_TeamStatus\TeamStatusAlertTones
xcopy /Y /S "%thisdir%\WindowsNoEditor\FSD\Content\%subPath%\*" "%packerdir%\Input\Content\%subPath%\"
call :PackAndCopy

set pakName=TeamStatusWidget
rmdir /S /Q "%packerdir%\Input"
mkdir "%packerdir%\Input"
mkdir "%packerdir%\Input\Content"
copy  /Y    "%thisdir%\WindowsNoEditor\FSD\AssetRegistry.bin" "%packerdir%\Input\AssetRegistry.bin"
set subPath=_TeamStatus\TeamStatusWidget
xcopy /Y /S "%thisdir%\WindowsNoEditor\FSD\Content\%subPath%\*" "%packerdir%\Input\Content\%subPath%\"
call :PackAndCopy

set pakName=SimpleHUDUpgrades
rmdir /S /Q "%packerdir%\Input"
mkdir "%packerdir%\Input"
mkdir "%packerdir%\Input\Content"
copy  /Y    "%thisdir%\WindowsNoEditor\FSD\AssetRegistry.bin" "%packerdir%\Input\AssetRegistry.bin"
set subPath=_TeamStatus\SimpleHUDUpgrades
xcopy /Y /S "%thisdir%\WindowsNoEditor\FSD\Content\%subPath%\*" "%packerdir%\Input\Content\%subPath%\"
call :PackAndCopy

mkdir "%thisdir%/Public"
rmdir /S /Q "%thisdir%/Public/vLatestBuild"
mkdir "%thisdir%/Public/vLatestBuild"
for /f "delims=" %%f in (%thisdir%/PublicInterfaces.txt) do (
    echo "Copying public interface file: %%~nxf"
    echo F|xcopy /F /Y "%thisdir%\%%f" "%thisdir%\Public\vLatestBuild\%%f"
)

cd %orig_cwd%
pause
EXIT /B 0

:PackAndCopy
mkdir "%installedDir%\%pakName%"
call %packerdir%\_Repack.bat "%packerdir%\Input"
del "%packerdir%\autogen.txt"
move /Y "%packerdir%\Input.pak" "%thisdir%\Releases\vLatestBuild\"
move /Y "%thisdir%\Releases\vLatestBuild\Input.pak" "%thisdir%\Releases\vLatestBuild\%pakName%.pak"
move /Y "%installedDir%\%pakName%\%pakName%.pak.4.bak" "%installedDir%\%pakName%\%pakName%.pak.5.bak"
move /Y "%installedDir%\%pakName%\%pakName%.pak.3.bak" "%installedDir%\%pakName%\%pakName%.pak.4.bak"
move /Y "%installedDir%\%pakName%\%pakName%.pak.2.bak" "%installedDir%\%pakName%\%pakName%.pak.3.bak"
move /Y "%installedDir%\%pakName%\%pakName%.pak.1.bak" "%installedDir%\%pakName%\%pakName%.pak.2.bak"
move /Y "%installedDir%\%pakName%\%pakName%.pak"       "%installedDir%\%pakName%\%pakName%.pak.1.bak"
copy /Y "%thisdir%\Releases\vLatestBuild\%pakName%.pak" "%installedDir%\%pakName%\"
rmdir /S /Q "%packerdir%\Input"
mkdir "%packerdir%\Input"
EXIT /B 0
