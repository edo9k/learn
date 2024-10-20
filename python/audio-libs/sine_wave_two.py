import numpy as np
import sounddevice as sd

def gen(frequency, duration=0.5, sample_rate=44100):
    t = np.linspace(0, duration, int(sample_rate * duration), endpoint=False)
    wave = 0.5 * np.sin(2 * np.pi * frequency * t)
    return wave

melody_frequences = [261.63, 293.66, 329.63, 349.23, 392.00, 440.00, 493.88, 523.25]
melody_duration = 0.5


for frequency in melody_frequences:
    wave = gen(frequency)
    sd.play(wave, 44100)
    sd.wait()


