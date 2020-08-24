@echo off
echo "== Mycroft CLI launcher =="
REM "This script is not as good as the Linux' one"

md logs

echo "Launching venv..."
call .\.venv\Scripts\activate.bat

echo "Launching bus service..."
start "Mycroft bus service" /min cmd /c "py -m mycroft.messagebus.service > logs\bus.log "

echo "Launching skills service..."
start "Mycroft skills service" /min cmd /c "py -m mycroft.skills > logs\skills.log "

echo "Launching CLI..."
set TERM='xterm-256color'
py -m mycroft.client.text
