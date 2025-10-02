impl GuessGame.start {
    if not [root --> (`?turn)] {
        next = root ++> turn(random.randint(1, 20));
    } else {
        next = [root --> (`?turn)];
    }
    visit next;
}

impl GuessGame.process_guess {
    if [-->] {
        visit [-->];
    } else {
        # Ask the user for a guess
        self.guess = int(input("Enter your guess (1–20):"));

        if self.guess < here.correct_number {
            print("Too low!");
            visit here;   # stay on same turn node
        } elif self.guess > here.correct_number {
            print("Too high!");
            visit here;   # stay on same turn node
        } else {
            print("Congratulations!!! You guessed correctly.");
            disengage;   # end game
        }
    }
}
