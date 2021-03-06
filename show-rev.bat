@echo off
@rem http://www.robvanderwoude.com/escapechars.php
set PATH=%PATH%;C:\Program Files\Git\usr\bin
for /f "usebackq" %%s in (`git log --oneline ^| wc -l ^| sed -e "s/[ \t]*//g"`) do (
	set REVISIONS=%%s
)

@rem https://www.appveyor.com/docs/environment-variables/
echo REVISIONS                     = %REVISIONS%
echo APPVEYOR                      = %APPVEYOR%
echo APPVEYOR_URL                  = %APPVEYOR_URL%
echo APPVEYOR_BUILD_NUMBER         = %APPVEYOR_BUILD_NUMBER%
echo APPVEYOR_PULL_REQUEST_NUMBER  = %APPVEYOR_PULL_REQUEST_NUMBER%
echo APPVEYOR_REPO_PROVIDER        = %APPVEYOR_REPO_PROVIDER%
echo APPVEYOR_REPO_BRANCH          = %APPVEYOR_REPO_BRANCH%
echo APPVEYOR_PULL_REQUEST_HEAD_REPO_NAME   = %APPVEYOR_PULL_REQUEST_HEAD_REPO_NAME%
echo APPVEYOR_PULL_REQUEST_HEAD_REPO_BRANCH = %APPVEYOR_PULL_REQUEST_HEAD_REPO_BRANCH%
echo APPVEYOR_REPO_PROVIDER            = %APPVEYOR_REPO_PROVIDER%
echo APPVEYOR_REPO_NAME                = %APPVEYOR_REPO_NAME%
echo APPVEYOR_REPO_TAG                 = %APPVEYOR_REPO_TAG%
echo APPVEYOR_REPO_TAG_NAME            = %APPVEYOR_REPO_TAG_NAME%
echo APPVEYOR_PULL_REQUEST_HEAD_COMMIT = %APPVEYOR_PULL_REQUEST_HEAD_COMMIT%
echo APPVEYOR_REPO_COMMIT              = %APPVEYOR_REPO_COMMIT%
echo APPVEYOR_REPO_TAG_NAME            = %APPVEYOR_REPO_TAG_NAME%
echo APPVEYOR_REPOSITORY_SHALLOW_CLONE_TIMEOUT = %APPVEYOR_REPOSITORY_SHALLOW_CLONE_TIMEOUT%

for /f "usebackq" %%s in (`git show -s --format^=%%H`) do (
    set COMMITID=%%s
)
echo COMMITID                          = %COMMITID%

set PREFIX_GITHUB=https://github.com
set COMMIT_URL=%PREFIX_GITHUB%/%APPVEYOR_REPO_NAME%/commit/%APPVEYOR_REPO_COMMIT%
if "%APPVEYOR_REPO_PROVIDER%" == "gitHub" (
	@rem Not Pull Request
	if "%APPVEYOR_PULL_REQUEST_NUMBER%" == "" (
		@rem https://github.com/m-tmatma/test-git-log-oneline/commit/32b2f9dcede522242b0805f4a12fa290d1c14018
	) else (
		@rem https://github.com/m-tmatma/test-git-log-oneline/pull/2/commits/4a93c7a41c226d75c9e5dbc6031cabd8730cd4a3
		set COMMIT_URL_PR_HEAD=%PREFIX_GITHUB%/%APPVEYOR_REPO_NAME%/pull/%APPVEYOR_PULL_REQUEST_NUMBER%/commits/%APPVEYOR_PULL_REQUEST_HEAD_COMMIT%
	)
)
echo COMMIT_URL                   = %COMMIT_URL%
echo COMMIT_URL_PR_HEAD           = %COMMIT_URL_PR_HEAD%

@rem ci skip
echo test
echo test
