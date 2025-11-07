@echo off
cd /d "%~dp0"
echo Generating keystore...

REM Use gradlew to get Java path
for /f "delims=" %%i in ('gradlew.bat -version 2^>^&1 ^| findstr /C:"JVM:"') do set JAVA_LINE=%%i

REM Extract Java version info (just to confirm Java is found)
echo Found Java: %JAVA_LINE%

REM Set JAVA_HOME if gradle has it
if not defined JAVA_HOME (
    echo WARNING: JAVA_HOME not set, trying Android Studio JDK...
    if exist "C:\Program Files\Android\Android Studio\jbr\bin\keytool.exe" (
        set "KEYTOOL=C:\Program Files\Android\Android Studio\jbr\bin\keytool.exe"
    ) else (
        echo ERROR: keytool not found!
        pause
        exit /b 1
    )
) else (
    set "KEYTOOL=%JAVA_HOME%\bin\keytool.exe"
)

REM Generate keystore
echo Using keytool: %KEYTOOL%
"%KEYTOOL%" -genkey -v -keystore judaism-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias judaism-key -storepass aaaaaaaa -keypass aaaaaaaa -dname "CN=Judaism, OU=Development, O=Judaism App, L=City, S=State, C=US"

if exist judaism-release-key.jks (
    echo.
    echo SUCCESS! Keystore created: judaism-release-key.jks
    echo You can now run: flutter build apk --release
) else (
    echo.
    echo ERROR: Keystore not created!
)

pause

