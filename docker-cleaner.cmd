@echo off

:menu
if "%~1"=="" goto help

if "%~1"=="--volumes" (
    echo "Volumes can't be managed in this script due to limitations in Windows batch."
    goto end
)

if "%~1"=="--images" (
    call :imagesClean
    goto end
)

if "%~1"=="--containers" (
    call :containersClean
    goto end
)

if "%~1"=="--all" (
    call :allClean
    goto end
)

if "%~1"=="--help" (
    goto help
)

goto end

:containersClean
echo "Stop all Containers"
for /f "tokens=*" %%a in ('docker ps -q') do docker stop %%a
echo "Remove all Containers"
for /f "tokens=*" %%a in ('docker ps -aq') do docker rm %%a
goto :eof

:imagesClean
echo "Remove all Images"
for /f "tokens=*" %%a in ('docker images -q') do docker image rm -f %%a
goto :eof

:allClean
call :containersClean
call :imagesClean
goto :eof

:help
echo "Usage: %~nx0 [--volumes | --images | --containers | --all | --help]"
echo "Clean Docker ressources from the local host"
echo.
echo "Options:"
echo "  --volumes      Can't be managed in this script due to limitations in Windows batch."
echo "  --images       Remove all Images"
echo "  --containers   Stop and remove all containers"
echo "  --all          Stop all container, then remove all containers and images"
echo "  --help         Show this help"
echo.
goto :eof

:end