@echo off
@rem http://www.robvanderwoude.com/escapechars.php
set PATH=%PATH%;C:\Program Files\Git\usr\bin
for /f "usebackq" %%s in (`git log --oneline ^| wc -l ^| sed -e "s/[ \t]*//g"`) do (
	set REVISIONS=%%s
)

echo REVISIONS = %REVISIONS%
