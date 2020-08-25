# Mycroft porting on MS Windows

## Install and run

1. Install Python 3.x for Windows
2. Run dev_setup.bat

3. The latter should install some Windows-specific Python modules: `fann2`, `PyAudio`, `curses`.
If not, download and install required binaries from https://www.lfd.uci.edu/~gohlke/pythonlibs/

4. If you want `mimic`, you must build mimic by yourself.
5. Run with `start-mycroft.bat`. Currently, this run the CLI.

## Main problems

* In Windows, ALSA does not exist.
* Precise binaries for Windows do not exist (see `mycroft/client/speech/hotword_factory.py`)

## Main modifications done in source code

* Websocket port is 127.0.0.1, not 0.0.0.0 (see `mycroft.conf`)
* Use Windows Media Player instead of `paplay` (see `mycroft.conf`)
* Signal `SIGKILL` does not exists, replaced with `CTRL_C_EVENT` (see `mycroft/lock/__init__.py`)
* `/dev/null` becomes `NUL` (see `mycroft/client/speech/hotword_factory.py`)
* Curse colors up to 254, not 255 (see `mycroft/client/text/text_client.py`)
