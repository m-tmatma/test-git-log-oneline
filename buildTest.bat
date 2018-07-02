
set PREFIX_GITHUB=https://github.com
if "%APPVEYOR_REPO_PROVIDER%" == "gitHub" (
	set COMMIT_URL=%PREFIX_GITHUB%/%APPVEYOR_REPO_NAME%/commit/%APPVEYOR_REPO_COMMIT%
	@rem Not Pull Request
	if "%APPVEYOR_PULL_REQUEST_NUMBER%" == "" (
		@rem No PR
	) else (
		@rem PR URL
		set COMMIT_URL_PR_HEAD=%PREFIX_GITHUB%/%APPVEYOR_REPO_NAME%/pull/%APPVEYOR_PULL_REQUEST_NUMBER%/commits/%APPVEYOR_PULL_REQUEST_HEAD_COMMIT%
	)
)

@echo SHORT_COMMITID: %SHORT_COMMITID%
@echo COMMITID: %COMMITID%
@echo GIT_URL: %GIT_URL%
@echo APPVEYOR_URL          : %APPVEYOR_URL%
@echo APPVEYOR_REPO_NAME    : %APPVEYOR_REPO_NAME%
@echo APPVEYOR_ACCOUNT_NAME : %APPVEYOR_ACCOUNT_NAME%
@echo APPVEYOR_PROJECT_SLUG : %APPVEYOR_PROJECT_SLUG%
@echo APPVEYOR_BUILD_VERSION: %APPVEYOR_BUILD_VERSION%
@echo APPVEYOR_BUILD_NUMBER : %APPVEYOR_BUILD_NUMBER%
@echo COMMIT_URL            : %COMMIT_URL%
@echo COMMIT_URL_PR_HEAD    : %COMMIT_URL_PR_HEAD%

: Output githash.h
set GITHASH_H=githash.h
set GITHASH_H_TMP=%GITHASH_H%.tmp
type nul                                  > %GITHASH_H_TMP%
echo #pragma once                        >> %GITHASH_H_TMP%
if "%COMMITID%" == "" (
	type nul                                  >> %GITHASH_H_TMP%
) else (
	echo #define GIT_COMMIT_HASH "%COMMITID%" >> %GITHASH_H_TMP%
)
if "%SHORT_COMMITID%" == "" (
	type nul                                              >> %GITHASH_H_TMP%
) else (
	echo #define GIT_SHORT_COMMIT_HASH "%SHORT_COMMITID%" >> %GITHASH_H_TMP%
)
if "%GIT_URL%" == "" (
	type nul                                              >> %GITHASH_H_TMP%
) else (
	echo #define GIT_URL "%GIT_URL%"                      >> %GITHASH_H_TMP%
)

if "%APPVEYOR_URL%" == "" (
	type nul                                              >> %GITHASH_H_TMP%
) else (
	echo #define APPVEYOR_URL "%APPVEYOR_URL%"            >> %GITHASH_H_TMP%
)

if "%APPVEYOR_REPO_NAME%" == "" (
	type nul                                                          >> %GITHASH_H_TMP%
) else (
	echo #define APPVEYOR_REPO_NAME "%APPVEYOR_REPO_NAME%"            >> %GITHASH_H_TMP%
)

if "%APPVEYOR_ACCOUNT_NAME%" == "" (
	type nul                                                          >> %GITHASH_H_TMP%
) else (
	echo #define APPVEYOR_ACCOUNT_NAME "%APPVEYOR_ACCOUNT_NAME%"      >> %GITHASH_H_TMP%
)

if "%APPVEYOR_PROJECT_SLUG%" == "" (
	type nul                                                          >> %GITHASH_H_TMP%
) else (
	echo #define APPVEYOR_PROJECT_SLUG "%APPVEYOR_PROJECT_SLUG%"      >> %GITHASH_H_TMP%
)

if "%APPVEYOR_BUILD_VERSION%" == "" (
	type nul                                                          >> %GITHASH_H_TMP%
) else (
	echo #define APPVEYOR_BUILD_VERSION "%APPVEYOR_BUILD_VERSION%"    >> %GITHASH_H_TMP%
)

if "%APPVEYOR_BUILD_NUMBER%" == "" (
	type nul                                                          >> %GITHASH_H_TMP%
) else (
	echo #define APPVEYOR_BUILD_NUMBER     "%APPVEYOR_BUILD_NUMBER%"      >> %GITHASH_H_TMP%
	echo #define APPVEYOR_BUILD_NUMBER_INT  %APPVEYOR_BUILD_NUMBER%       >> %GITHASH_H_TMP%
)

if "%COMMIT_URL%" == "" (
	type nul                                                          >> %GITHASH_H_TMP%
) else (
	echo #define COMMIT_URL     "%COMMIT_URL%"                        >> %GITHASH_H_TMP%
)

if "%COMMIT_URL_PR_HEAD%" == "" (
	type nul                                                          >> %GITHASH_H_TMP%
) else (
	echo #define COMMIT_URL_PR_HEAD     "%COMMIT_URL_PR_HEAD%"        >> %GITHASH_H_TMP%
)

fc %GITHASH_H% %GITHASH_H_TMP% 1>nul 2>&1
if "%ERRORLEVEL%" == "0" (
	del %GITHASH_H_TMP%
) else (
	if exist %GITHASH_H% del %GITHASH_H%
	move /y %GITHASH_H_TMP% %GITHASH_H%
	@echo %GITHASH_H% updated.
)

ENDLOCAL
rem exit 0
