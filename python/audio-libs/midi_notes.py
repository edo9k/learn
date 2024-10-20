
import mido
from mido import MidiFile, MidiTrack, Message

# new midi file
mid = MidiFile()
track = MidiTrack()
mid.tracks.append(track)

# adding some notes
track.append(Message('note_on',  note=60, velocity=64, time=0))   # C4
track.append(Message('note_off', note=60, velocity=64, time=480)) # C4 off
track.append(Message('note_on',  note=62, velocity=64, time=0))   # D4
track.append(Message('note_off', note=62, velocity=64, time=480)) # D4 off

mid.save("output.mid") 

