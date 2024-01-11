@echo off
cd /d %~dp0

@REM Create api directory if it doesn't exist, and fill it with a pubspec.yaml
set "directory=api/music_server_api"
if not exist "%directory%" mkdir "%directory%"
if not exist "%directory%/pubspec.yaml" (
  (
      echo.name: music_server_api
      echo.
      echo.environment:
      echo.  sdk: ">=2.15.0 <3.0.0"
  ) > "%directory%\pubspec.yaml"
)

@REM Generate the api
dart run build_runner build
