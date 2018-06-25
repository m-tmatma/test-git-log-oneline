set PATH=%PATH%;C:\Program Files\Git\usr\bin
git log --oneline | wc -l | sed -e "s/[ \t]*//g"
