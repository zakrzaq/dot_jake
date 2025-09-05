import ctypes
import ctypes.wintypes
import random
import time
import sys

if sys.platform != 'win32':
    raise Exception('This script only works on Windows.')

# Fix DPI scaling issues
try:
    ctypes.windll.user32.SetProcessDPIAware()
except AttributeError:
    pass

# Win32 constants
KEYEVENTF_KEYDOWN = 0x0000
KEYEVENTF_KEYUP = 0x0002

# Map of keys we care about
keyboardMapping = {
    'left': 0x25,
    'up': 0x26,
    'right': 0x27,
    'down': 0x28,
    'space': 0x20,
}

# Add Latin alphabet
for c in range(65, 91):   # A–Z
    keyboardMapping[chr(c).lower()] = c

def press_key(key: str):
    """Press and release a key."""
    if key not in keyboardMapping:
        return
    vk = keyboardMapping[key]
    ctypes.windll.user32.keybd_event(vk, 0, KEYEVENTF_KEYDOWN, 0)
    ctypes.windll.user32.keybd_event(vk, 0, KEYEVENTF_KEYUP, 0)
    print(f"Pressed {key}")

def main():
    keys = list(keyboardMapping.keys())
    print("Starting random key presser...")

    while True:
        # Pick 3 random keys
        for _ in range(3):
            key = random.choice(keys)
            press_key(key)
            time.sleep(0.2)  # small delay between keys

        # Wait 60–240 seconds before next run
        delay = random.randint(60, 240)
        print(f"Waiting {delay} seconds...")
        time.sleep(delay)

if __name__ == "__main__":
    main()