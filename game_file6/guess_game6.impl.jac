impl GuessGame.start {
    if not [root --> (`?turn)] {
        next = root ++> turn(random.randint(1, 10));
    } else {
        next = [root --> (`?turn)];
    }
    visit next;  
}

impl GuessGame.process_guess {
    if [-->] {
        visit [-->];
    } else {
        self.guess = int(input("Enter your guess: "));

        if self.guess < here.correct_number {
            print("Wrong guess:", self.guess);
            print("Hint:", give_hint(self.guess, here.correct_number));
            next = here ++> turn(here.correct_number);
            visit next;   
        } elif self.guess > here.correct_number {
            print("Wrong guess:", self.guess);
            print("Hint:", give_hint(self.guess, here.correct_number));
            next = here ++> turn(here.correct_number);
            visit next;   
        } else {
            print("Congratulations! You guessed correctly:", self.guess);
            disengage;
        }
    }
}
