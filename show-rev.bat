@echo off
@rem http://www.robvanderwoude.com/escapechars.php
set PATH=%PATH%;C:\Program Files\Git\usr\bin
for /f "usebackq" %%s in (`git log --oneline ^| wc -l ^| sed -e "s/[ \t]*//g"`) do (
	set REVISIONS=%%s
)

echo REVISIONS                     = %REVISIONS%
echo APPVEYOR                      = %APPVEYOR%
echo APPVEYOR_URL                  = %APPVEYOR_URL%
echo APPVEYOR_PULL_REQUEST_NUMBER  = %APPVEYOR_PULL_REQUEST_NUMBER%
echo APPVEYOR_REPO_PROVIDER        = %APPVEYOR_REPO_PROVIDER%
echo APPVEYOR_REPO_BRANCH          = %APPVEYOR_REPO_BRANCH%
echo APPVEYOR_PULL_REQUEST_HEAD_REPO_BRANCH = %APPVEYOR_PULL_REQUEST_HEAD_REPO_BRANCH%
echo APPVEYOR_REPO_PROVIDER            = %APPVEYOR_REPO_PROVIDER%
echo APPVEYOR_REPO_NAME                = %APPVEYOR_REPO_NAME%
echo APPVEYOR_REPO_TAG                 = %APPVEYOR_REPO_TAG%
echo APPVEYOR_REPO_TAG_NAME            = %APPVEYOR_REPO_TAG_NAME%
echo APPVEYOR_PULL_REQUEST_HEAD_COMMIT = %APPVEYOR_PULL_REQUEST_HEAD_COMMIT%
echo APPVEYOR_REPO_COMMIT              = %APPVEYOR_REPO_COMMIT%

set PREFIX_GITHUB=https://github.com
if "%APPVEYOR_REPO_PROVIDER%" == "gitHub" (
	@rem Not Pull Request
	if "%APPVEYOR_PULL_REQUEST_NUMBER%" == "" (
		@rem https://github.com/m-tmatma/test-git-log-oneline/commit/32b2f9dcede522242b0805f4a12fa290d1c14018
		set COMMIT_URL=%PREFIX_GITHUB%/%APPVEYOR_REPO_NAME%/commit/%APPVEYOR_REPO_COMMIT%
	) else (
		@rem https://github.com/m-tmatma/test-git-log-oneline/pull/2/commits/4a93c7a41c226d75c9e5dbc6031cabd8730cd4a3
		set COMMIT_URL=%PREFIX_GITHUB%/%APPVEYOR_REPO_NAME%/pull/commits/%APPVEYOR_PULL_REQUEST_NUMBER%/%APPVEYOR_REPO_COMMIT%
	)
)
echo COMMIT_URL                        = %COMMIT_URL%
