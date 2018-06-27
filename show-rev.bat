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
