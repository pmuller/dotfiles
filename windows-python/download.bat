set URL=%1
set TARGET=%2

if exist %TARGET% (
    @echo Re-using previously downloaded %TARGET%
) else (
    @echo Downloading %TARGET% from %URL% ...
    @bitsadmin /transfer "setuptools" %URL% %TARGET%
)
