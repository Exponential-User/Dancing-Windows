### Warning
#### This has flashing lights

# Requirements
Python 3.8+

### Modules
`pygame` `numpy` `librosa` `pillow` `mutagen`

# Info

Run `Starter.bat` to install required modules and start,

or run this in command prompt and run `main.py`:
```
pip install pygame numpy librosa pillow mutagen
```

Enter your mp3 file name. ***(The file must be in the same directory as the python script)***

You can enter how high the windows can jump.

You can enter your frame rate.

You can enter the tempo.


# Customization

Edit `main.py` and find this under `Configuration`:
```python
        ...
        self.W_WIDTH, self.W_HEIGHT = 500, 300  # Main window size WxH -  -  -  -  -  -  -  (Default: 500 x 300)

        self.SQUARE_SIZE = 200                  # Dancer window size (square)   -  -  -  -  (Default: 200)
        self.ORBIT_RADIUS = 500                 # Orbit radius in pixels  -  -  -  -  -  -  (Default: 500)

        self.GATE_MULTIPLIER = 0.48             # Adaptive gate sensitivity  -  -  -  -  -  (Default: 0.48)
        self.BASS_RADIUS_PULL = 0.53            # Minimum orbit size   -  -  -  -  -  -  -  (Default: 0.53)
        self.MIN_GATE_DROP = 0.025              # Min RMS drop to trigger gate  -  -  -  -  (Default: 0.025)
        self.BASS_SPEED_BOOST = 3.6             # How much faster the orbit spins on bass   (Default: 3.6)
        self.BASS_SPEED_THRESHOLD = 0.45        # Bass strength to trigger speed boost   -  (Default: 0.45)
        self.VOLUME = 0.38                      # Audio volume (0.0 to 1.0)  -  -  -  -  -  (Default: 0.38)

        self.JUMP_DAMPING = 0.85                # Jump bounce damping  -  -  -  -  -  -  -  (Default: 0.85)
        self.JUMP_GRAVITY = 1.4                 # Jump gravity effect  -  -  -  -  -  -  -  (Default: 1.4)
        self.JUMP_BASS_THRESHOLD = 0.32         # Bass strength to trigger jump -  -  -  -  (Default: 0.32)
        self.JUMP_REARM_VELOCITY = 1.0          # Min downward velocity to rearm jump -  -  (Default: 1.0)

        self.TELEPORT_COOLDOWN = 2.7            # Seconds between teleports  -  -  -  -  -  (Default: 2.7)
        self.BG_FADE_SPEED = 0.12               # Background color fade speed   -  -  -  -  (Default: 0.12)
        self.BG_DANCERS_FADE_SPEED = 0.1        # Dancer bg color fade speed -  -  -  -  -  (Default: 0.1)
        ...
```
