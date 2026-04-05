@echo off
echo [tests] Running backend tests...
cd backend
dotnet test
set BACKEND_EXIT=%ERRORLEVEL%
cd ..

echo [tests] Running frontend tests...
cd frontend
call npm test
set FRONTEND_EXIT=%ERRORLEVEL%
cd ..

echo.
echo ========================================
if %BACKEND_EXIT% == 0 (echo [tests] Backend:  PASSED) else (echo [tests] Backend:  FAILED)
if %FRONTEND_EXIT% == 0 (echo [tests] Frontend: PASSED) else (echo [tests] Frontend: FAILED)
echo ========================================
