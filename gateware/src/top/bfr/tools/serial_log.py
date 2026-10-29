"""Log the Tiliqua's debug serial port (the softcore's UART) to a file.

    python tools/serial_log.py COM6 ../../../build/bfr-serial.log [minutes]

Reconnects when the port goes away (re-flashing, power cycles), and
timestamps each line.
"""

import sys
import time

import serial


def main():
    port, path = sys.argv[1], sys.argv[2]
    minutes = float(sys.argv[3]) if len(sys.argv) > 3 else 60
    end = time.time() + minutes * 60
    with open(path, "a", encoding="utf-8", buffering=1) as log:
        log.write(f"--- {time.strftime('%H:%M:%S')} logging {port}\n")
        while time.time() < end:
            try:
                with serial.Serial(port, 115200, timeout=0.5) as s:
                    line = b""
                    while time.time() < end:
                        line += s.read(256)
                        while b"\n" in line:
                            text, line = line.split(b"\n", 1)
                            log.write(f"{time.strftime('%H:%M:%S')} "
                                      f"{text.decode(errors='replace').rstrip()}\n")
            except (serial.SerialException, OSError):
                time.sleep(1)


if __name__ == "__main__":
    main()
