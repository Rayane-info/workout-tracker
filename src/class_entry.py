import tkinter as tk

class Entry:
    def __init__(self,parent, label_text, show=None):
        self.parent = parent
        self.label_text = label_text
        self.show = show

    def create_entry(self):
        tk.Label(self.parent, text=self.label_text).pack(pady=5)
        entry = tk.Entry(self.parent, show=self.show)
        entry.pack(pady=5)
        return entry