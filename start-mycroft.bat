@echo off
echo "== Mycroft CLI launcher =="
REM "This script is not as good as the Linux' one"

echo "Launching venv..."
call .\.venv\Scripts\activate.bat

echo "Launching bus service..."
py -m mycroft.messagebus.service &

echo "Launching skills service..."
py -m mycroft.skills &

echo "Launching CLI..."
py -m mycroft.client.text
