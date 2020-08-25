@echo off
echo "== Mycroft CLI launcher =="
REM "This script is not as good as the Linux' one

md logs

echo "Launching venv..."
call .\.venv\Scripts\activate.bat

echo "Launching bus service..."
start "Mycroft bus service" /min cmd /c "py -m mycroft.messagebus.service > logs\bus.log "

echo "Launching skills service..."
start "Mycroft skills service" /min cmd /c "py -m mycroft.skills > logs\skills.log "

echo "Launching audio service..."
start "Mycroft audio service" /min cmd /c "py -m mycroft.audio > logs\audio.log "

echo "Launching voice service..."
start "Mycroft voice service" /min cmd /c "py -m mycroft.client.speech > logs\voice.log "

echo "Launching enclosure service..."
start "Mycroft enclosure service" /min cmd /c "py -m mycroft.client.enclosure > logs\enclosure.log "

echo "Launching CLI..."
py -m mycroft.client.text
