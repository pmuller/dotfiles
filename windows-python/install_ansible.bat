REM Ansible is NOT supported on Windows :-\

@call settings.bat
@set PYCRYPTO_VERSION=2.6
@set PYCRYPTO_MAIN_VERSION=%PYCRYPTO_VERSION:~0,1%%PYCRYPTO_VERSION:~-1%
@set PYCRYPTO_URL=http://www.voidspace.org.uk/downloads/pycrypto%PYCRYPTO_MAIN_VERSION%/pycrypto-%PYCRYPTO_VERSION%.win-%ARCH%-py%PYTHON_BRANCH%.exe

easy_install %PYCRYPTO_URL%
pip install ansible
cd %PYTHON_SCRIPTS%
echo %PYTHON_PREFIX%\python %PYTHON_SCRIPTS%\ansible > ansible.bat
pause
