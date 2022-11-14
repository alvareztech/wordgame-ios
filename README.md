# WordGame for iOS

By Daniel Alvarez, [alvarez.tech](https://alvarez.tech).

## Milestones

- [Milestone 1](https://github.com/alvareztech/wordgame-ios/tree/milestone1)
- [Milestone 2](https://github.com/alvareztech/wordgame-ios/tree/milestone2)

## Info

### How much time was invested

About 4 hours.

### How was the time distributed (concept, model layer, view(s), game mechanics)

The game is very small so I decided to use a minimal architecture pattern MV ([see more about MV](https://developer.apple.com/forums/thread/699003)). Definitely if the application had more layers, network, data storage, etc. and each of these parts need to be tested, a more natural choice would have been MVVM.

- Model (1 hr)
  - Word (All related to the Word model, including reading words)
- View (1.5 hr)
  - WordScreen (UI and screen logic, game logic)
- Unit Tests & UI Tests implemented (1.5 hr)

### Decisions made to solve certain aspects of the game

Simplifying the code using the modern features that Swift, SwiftUI provides us with was important. This minimizes the amount of code and files. _Less code, less bugs._

### Decisions made because of restricted time

I focus on meeting the requirements of each Milestone. UI, UX was secondary as it was not mentioned in the requirements.

### What would be the first thing to improve or add if there had been more time

As a game, it is important that it is attractive to users. I would have added animations, better design, colors, etc.

Also prepare the application to scale it big by perhaps selecting other patterns and making it more testable.
