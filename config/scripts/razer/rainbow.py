import colorsys
import random
from time import sleep

from openrazer.client import DeviceManager
from openrazer.client import constants as razer_constants

FPS = 30
WAVE_SPEED = 0.0025
WAVE_REPEAT = 0.5	# How many waves fit across device

# Workaround for apparent bug in colorsys.hsv_to_rgb
# when hue is negative:
hue = WAVE_REPEAT

# Create a DeviceManager. This is used to get specific devices
device_manager = DeviceManager()

print("Found {} Razer devices".format(len(device_manager.devices)))

devices = device_manager.devices
for device in devices:
	if not device.fx.advanced:
		print("Skipping device " + device.name + " (" + device.serial + ")")
		devices.remove(device)

print()

# Disable daemon effect syncing.
# Without this, the daemon will try to set the lighting effect to every device.
device_manager.sync_effects = False

def gamma_correction(rgb):
	# Not exactly sRGB (n**2.2), this is
	# slightly darker, looks more neon:
	return tuple(map(lambda x: x ** 2.28, rgb))

def rainbow_rgb(hue, sat = 1.0, val = 1.0):
	rgb = colorsys.hsv_to_rgb(hue, sat, val)
	rgb_gamma = gamma_correction(rgb)
	return tuple(map(lambda x: int(255 * x), (rgb_gamma)))

def clear():
	for device in devices:
		rows, cols = device.fx.advanced.rows, device.fx.advanced.cols

		for row in range(rows):
			for col in range(cols):
				device.fx.advanced.matrix[row, col] = (0, 0, 0)

	#device.fx.advanced.draw()

# Rainbow moves across each device
def loop():
	global hue
	hue += WAVE_SPEED

	# Prevent float-precision bugs as hue grows
	# without bound. Trust me, this is important:
	if hue >= 100.0:
		hue -= 50.0

	#print("hue={}".format(hue))

	for device in devices:
		rows, cols = device.fx.advanced.rows, device.fx.advanced.cols

		for col in range(cols):
			col_hue = hue - col * (WAVE_REPEAT / device.fx.advanced.cols)

			for row in range(rows):
				device.fx.advanced.matrix[row, col] = rainbow_rgb(col_hue)

		device.fx.advanced.draw()

# Run forever
while True:
	loop()
	sleep(1.0 / FPS)
