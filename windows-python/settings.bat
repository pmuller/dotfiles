@set ARCH=amd64

@set PYTHON_BRANCH=2.7
@set PYTHON_BRANCH_REL=10
@set PYTHON_VERSION=%PYTHON_BRANCH%.%PYTHON_BRANCH_REL%
@set PYTHON_FILE=python-%PYTHON_VERSION%.%ARCH%.msi
@set PYTHON_URL=https://www.python.org/ftp/python/%PYTHON_VERSION%/%PYTHON_FILE%
@set PYTHON_TARGET=%CD%\%PYTHON_FILE%
@set PYTHON_PREFIX=c:\python\%PYTHON_BRANCH%
@set PYTHON_SCRIPTS=%PYTHON_PREFIX%\Scripts

@set SETUPTOOLS_URL=https://bootstrap.pypa.io/ez_setup.py
@set SETUPTOOLS_TARGET=%CD%\ez_setup.py
