import numpy as np
import sounddevice as sd

frequency = 440 
duration = 3.0
sample_rate = 44100


t = np.linspace(0, duration, int(sample_rate * duration), endpoint=False)

audio = 0.5 * np.sin(2 * np.pi * frequency * t)

sd.play(audio, sample_rate)
sd.wait()

