@echo off
REM Builds MazeGame.exe with MASM and the Irvine32 library.
REM Run it from the "x86 Native Tools Command Prompt for VS".
REM Irvine32 has to be installed in C:\Irvine.
set IRVINE=C:\Irvine
ml /nologo /c /coff /Zi /I"%IRVINE%" Main.asm Maze.asm
if errorlevel 1 goto Failed
link /nologo /debug /incremental:no /subsystem:console /safeseh:no /libpath:"%IRVINE%" /out:MazeGame.exe Main.obj Maze.obj Irvine32.lib kernel32.lib user32.lib
if errorlevel 1 goto Failed
echo Build succeeded: MazeGame.exe
goto :eof
:Failed
echo Build failed.
exit /b 1
