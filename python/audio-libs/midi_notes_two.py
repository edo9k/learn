
import mido
from mido import MidiFile, MidiTrack, Message

# new midi file
mid = MidiFile()
track = MidiTrack()
mid.tracks.append(track)


melody_notes = [60, 62, 64, 65, 67, 69, 71, 72] 
melody_duration = [480] * len(melody_notes) 

for note, duration in zip(melody_notes, melody_duration):
    track.append(Message('note_on',  note=note, velocity=64, time=0))   
    track.append(Message('note_off', note=note, velocity=64, time=duration))

mid.save("output2.mid") 

