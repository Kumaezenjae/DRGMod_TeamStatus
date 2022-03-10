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
mkdir "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\ChatAlert"

copy  /Y    "%thisdir%\WindowsNoEditor\FSD\AssetRegistry.bin" "%packerdir%\Input\AssetRegistry.bin"
xcopy /Y /S "%thisdir%\WindowsNoEditor\FSD\Content\*" "%packerdir%\Input\Content\"

call %packerdir%\_Repack.bat "%packerdir%\Input"

del "%packerdir%\autogen.txt"
move /Y "%packerdir%\Input _P.pak" "%thisdir%\Releases\vLatestBuild\"
move /Y "%thisdir%\Releases\vLatestBuild\Input _P.pak" "%thisdir%\Releases\vLatestBuild\ChatAlert.pak"
move /Y "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\ChatAlert\ChatAlert.pak.4.bak" "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\ChatAlert\ChatAlert.pak.5.bak"
move /Y "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\ChatAlert\ChatAlert.pak.3.bak" "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\ChatAlert\ChatAlert.pak.4.bak"
move /Y "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\ChatAlert\ChatAlert.pak.2.bak" "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\ChatAlert\ChatAlert.pak.3.bak"
move /Y "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\ChatAlert\ChatAlert.pak.1.bak" "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\ChatAlert\ChatAlert.pak.2.bak"
move /Y "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\ChatAlert\ChatAlert.pak"       "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\ChatAlert\ChatAlert.pak.1.bak"
copy /Y "%thisdir%\Releases\vLatestBuild\ChatAlert.pak" "c:\Program Files (x86)\Steam\steamapps\common\Deep Rock Galactic\FSD\Mods\ChatAlert\"

cd %orig_cwd%
pause

