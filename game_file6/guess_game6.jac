"""A Number Guessing Game"""

import random;
import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Provide a fun hint if guess is incorrect"""
def give_hint(guess: int, correct_number: int) -> str by llm();

walker GuessGame {
    has guess: int = 0;   # default so constructor works without args

    can start with `root entry;
    can process_guess with turn entry;
}


node turn {
    has correct_number: int = random.randint(1, 10);
}

with entry:__main__ {
    print("Welcome to the Number Guessing Game!");
    print("I'm thinking of a number between 1 and 10...");

    root spawn GuessGame();   #start the game
}
