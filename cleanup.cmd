::FOR /d /r . %d IN ("backdrops") DO @IF EXIST "%d" rd /s /q "%d"

FOR /d /r . %%d IN (backdrops) DO @IF EXIST "%%d" echo "%%d"

::FOR /d /r . %%d IN (backdrops) DO @IF EXIST "%%d" rd /s /q "%%d"