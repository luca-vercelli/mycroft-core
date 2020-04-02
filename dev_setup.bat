@echo off

REM ============================================================

REM INSTALLARE swig
REM https://netcologne.dl.sourceforge.net/project/swig/swigwin/swigwin-4.0.1/swigwin-4.0.1.zip
REM e metterlo nel PATH

REM ===Create virtualenv =======================================

pip3 install virtualenv
py -m venv .\.venv

call .\.venv\Scripts\activate.bat

REM ============================================================

py -m pip install --upgrade pip

REM == Install windows-specific modules ========================

rmdir /S /Q %LocalAppData%\pip\Cache

pip3 install pipwin
pipwin install fann2==1.1.2
REM fann2 version 1.0.x not available
pipwin install PyAudio==0.2.11

pipwin install curses


REM == ALSA does not exist in Windows =========================

move requirements.txt requirements.txt.bak
copy requirements-win.txt requirements.txt

REM == Go on with build =======================================

py setup.py build
py setup.py install
