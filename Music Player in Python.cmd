import pygame
import tkinter as tk
from tkinter import filedialog

class MusicPlayer:
    def __init__(self, root):
        self.root = root
        self.root.title("Music Player")
        self.root.geometry("300x100")

        pygame.init()
        pygame.mixer.init()

        self.track_var = tk.StringVar()
        self.status_var = tk.StringVar()

        self.track_label = tk.Label(root, textvariable=self.track_var)
        self.track_label.pack()

        self.status_label = tk.Label(root, textvariable=self.status_var)
        self.status_label.pack()

        self.play_button = tk.Button(root, text="Play", command=self.play_music)
        self.play_button.pack()

        self.pause_button = tk.Button(root, text="Pause", command=self.pause_music)
        self.pause_button.pack()

        self.stop_button = tk.Button(root, text="Stop", command=self.stop_music)
        self.stop_button.pack()

        self.load_button = tk.Button(root, text="Load Track", command=self.load_track)
        self.load_button.pack()

        self.music_file = None

    def load_track(self):
        self.music_file = filedialog.askopenfilename()

        if self.music_file:
            self.track_var.set("Track: " + self.music_file)
            pygame.mixer.music.load(self.music_file)
            self.status_var.set("Loaded")

    def play_music(self):
        if self.music_file:
            pygame.mixer.music.play()
            self.status_var.set("Playing")

    def pause_music(self):
        pygame.mixer.music.pause()
        self.status_var.set("Paused")

    def stop_music(self):
        pygame.mixer.music.stop()
        self.status_var.set("Stopped")

if __name__ == "__main__":
    root = tk.Tk()
    music_player = MusicPlayer(root)
    root.mainloop()
