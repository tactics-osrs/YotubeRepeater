@echo off
title Youtube Repeater

:help
echo This script takes your favorite YouTube video link and makes it play on repeat.
echo Simply input the URL of the video when prompted.
echo For example, if your favorite video is at "https://www.youtube.com/watch?v=dQw4w9WgXcQ", just enter that URL.
echo The script will then open the video in a new window, playing on repeat.
echo.
goto start

:start
echo Welcome to YouTube Repeater!
set /p url="Please enter the YouTube URL (or type 'help' for more information): "

if /I "%url%"=="help" goto help

echo %url% | findstr /R "^https\:\/\/www\.youtube\.com\/.*" >nul
if %errorlevel%==0 (
    set "repeater_url=%url:www.youtube.com=www.youtuberepeater.com%"
    start "" "%repeater_url%"
) else (
    echo Error: Invalid YouTube URL. Please ensure the URL is a valid YouTube video link.
    goto start
)
