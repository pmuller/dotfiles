call settings.bat

REM Unregister the .py extension
@assoc .py=

REM Unregister the python interpreter
@ftype python=

REM Ensure we have the Python's MSI
call download.bat %PYTHON_URL% %PYTHON_TARGET%

REM Uninstall Python
start /wait msiexec /passive /x python-2.7.10.amd64.msi

REM TODO: remove Python's directories from PATH
