import RPi.GPIO as GPIO
import sys

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(21, GPIO.OUT)

if len(sys.argv) > 1:
    cmd = sys.argv[1].lower()
    if cmd == "on":
        GPIO.output(21, GPIO.HIGH)
        print("LED ON")
    elif cmd == "off":
        GPIO.output(21, GPIO.LOW)
        print("LED OFF")

