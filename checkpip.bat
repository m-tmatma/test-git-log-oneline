where pip --help 1>nul 2>&1
if not "%ERRORLEVEL%" == "0" (
	@echo NOTE: No pip command
) else (
	@echo NOTE: found pip command
)


if "%APPVEYOR%" == "True" (
	@echo NOTE: appveyor
) else (
	@echo NOTE: not appveyor
)
