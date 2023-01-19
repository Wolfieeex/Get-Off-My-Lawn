@ECHO OFF
IF "%FXC%" == "" SET FXC="C:\Program Files (x86)\Windows Kits\10\bin\x64\fxc.exe"
IF NOT EXIST %FXC% (
	ECHO Couldn't find Windows 10 SDK, falling back to DXSDK...
	SET FXC="%DXSDK_DIR%\Utilities\bin\x86\fxc.exe"
	IF NOT EXIST % FXC % (
		ECHO Couldn't find DXSDK! Exiting...
		GOTO END
	)
)
%FXC% SSDSpatialAccumulation.usf /E MainCS /Zpr /Gec /O3 /T cs_5_0 /Ni /FcSSDSpatialAccumulation.d3dasm 
 pause
:END
REM
