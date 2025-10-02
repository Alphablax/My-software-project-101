"""Interactive Number Guessing Game"""

import random;

walker GuessGame {
    has guess: int;

    can start with `root entry;
    can process_guess with turn entry;
}

node turn {
    has correct_number: int = random.randint(1, 10);
}

# Run in CLI mode
with entry:__main__ {
    root spawn GuessGame(0);   # initial guess placeholder
}
