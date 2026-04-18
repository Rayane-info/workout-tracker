import tkinter as tk

class Button:
    def __init__(self,parent, text,command,size=(20,2)):
        self.parent= parent
        self.text=text
        self.command = command
        self.size=size


    def create_button(self):
        button = tk.Button(self.parent, text=self.text, command=self.command, width=self.size[0], height=self.size[1])
        button.pack(pady=10)
