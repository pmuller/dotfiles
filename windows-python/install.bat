@set SCRIPT_DIR=%~dp0
@set SCRIPT_DIR=%SCRIPT_DIR:~0,-1%

REM In order to configure association of .py files with the Python interpreter,
REM this script should be launched with administrative privileges.

@call %SCRIPT_DIR%\settings.bat

@call %SCRIPT_DIR%\download.bat %PYTHON_URL% %PYTHON_TARGET%
@echo Installing Python ...
start /wait msiexec /passive /i %PYTHON_TARGET% ^
    TARGETDIR=%PYTHON_PREFIX% ADDLOCAL=DefaultFeature,Extensions,Tools

REM @echo Adding Python to ^%PATH^% ...
REM setx PATH="%PATH%;%PYTHON_PREFIX%;%PYTHON_SCRIPTS%"

@echo Associating .py files with the python interpreter ...
assoc .py=python
ftype python="c:\python\2.7\python.exe" %1

@call %SCRIPT_DIR%\download.bat %SETUPTOOLS_URL% %SETUPTOOLS_TARGET%
@echo Installing setuptools ...
@%PYTHON_PREFIX%\python.exe ez_setup.py

@echo Installing pip ...
@%PYTHON_SCRIPTS%\easy_install.exe -q pip

@echo Installing virtualenv ...
@%PYTHON_SCRIPTS%\pip.exe -q install virtualenv

@echo Append this to your PATH: %PYTHON_PREFIX%;%PYTHON_PREFIX%\Scripts
pause
