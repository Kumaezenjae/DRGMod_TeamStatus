@echo off
setlocal EnableDelayedExpansion

set orig_cwd=%cd%

set thisdir=%~dp0
set thisdir=%thisdir:~0,-1%
cd  %thisdir%

set /p packerdir=<PackerDir.txt

rmdir /S /Q "%packerdir%\Input"
mkdir "%packerdir%\Input"
mkdir "%packerdir%\Input\Content"
mkdir "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\TeamStatus"

copy  /Y    "%thisdir%\WindowsNoEditor\FSD\AssetRegistry.bin" "%packerdir%\Input\AssetRegistry.bin"
xcopy /Y /S "%thisdir%\WindowsNoEditor\FSD\Content\*" "%packerdir%\Input\Content\"

call %packerdir%\_Repack.bat "%packerdir%\Input"

del "%packerdir%\autogen.txt"
move /Y "%packerdir%\Input.pak" "%thisdir%\Releases\vLatestBuild\"
move /Y "%thisdir%\Releases\vLatestBuild\Input.pak" "%thisdir%\Releases\vLatestBuild\TeamStatus.pak"
move /Y "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\TeamStatus\TeamStatus.pak.4.bak" "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\TeamStatus\TeamStatus.pak.5.bak"
move /Y "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\TeamStatus\TeamStatus.pak.3.bak" "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\TeamStatus\TeamStatus.pak.4.bak"
move /Y "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\TeamStatus\TeamStatus.pak.2.bak" "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\TeamStatus\TeamStatus.pak.3.bak"
move /Y "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\TeamStatus\TeamStatus.pak.1.bak" "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\TeamStatus\TeamStatus.pak.2.bak"
move /Y "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\TeamStatus\TeamStatus.pak"       "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\TeamStatus\TeamStatus.pak.1.bak"
copy /Y "%thisdir%\Releases\vLatestBuild\TeamStatus.pak" "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\TeamStatus\"

rmdir /S /Q "%packerdir%\Input"
mkdir "%packerdir%\Input"

cd %orig_cwd%
pause

