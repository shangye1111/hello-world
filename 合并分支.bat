@echo off
mode con lines=20 cols=60
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
rem ����ܷ�ʽ��cmd
cd /d "%~dp0"
title �ϲ�gitָ����֧����

:allStart
cls
echo [����commitid] �ύ��֧
echo [e] �˳�

set in=
set /p in=please enter the commitid:
if "%in%"=="e" goto stop
if "%in%" neq "e" goto start

:start
git checkout ytw
git cherry-pick in
git add ./
git cherry-pick -- continue

:stop
exit