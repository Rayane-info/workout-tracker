import tkinter as tk
from class_button import Button
from class_entry import Entry
from connect_db import connect_to_db

class WorkoutTrackerApp:
    def __init__(self,root):
        self.root = root
        self.root.title("Workout Tracker")
        self.root.geometry("1280x720")
        self.root.configure(bg="#f0f0f0")
        self.root.resizable(False, False)
        self.conn = connect_to_db()
        self.create_widgets()
        


    def create_widgets(self):
        self.add_athlete_button = Button(self.root, "Add Athlete", self.add_athlete, size=(20, 2))
        self.add_athlete_button.create_button()
        self.add_workout_button = Button(self.root, "Add Workout", lambda: print("Add Workout button clicked"), size=(20, 2))
        self.add_workout_button.create_button()
        

    def add_athlete(self):
        print( "Add Athlete button clicked!")
        with self.conn.cursor() as cursor:
            cursor.execute("INSERT INTO athlete (genre, name, birth_date, weight, height) VALUES (?, ?, ?, ?, ?)", (input("Enter genre: "), input("Enter name: "), input("Enter birth date (YYYY-MM-DD): "), input("Enter weight: "), input("Enter height: ")))
            self.conn.commit()
            print("Athlete added successfully!")

