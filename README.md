# Chess Ruby

Ruby Chess simple command line chess application.  Two human players will be able to play a game of chess via command line input and see the board via command line output

## Installation

Clone the repo and run bundle install in terminal:
```
$ bundle install
```
## Usage

To start a new game run the following prompt in the chess_ruby directory:
```
$ ruby bin/run.rb
```
The following board should display in console

![Image of Board](https://github.com/BH792/chess_ruby/blob/master/img/Screen%20Shot%202017-09-05%20at%208.34.29%20AM.png)

Each player should take turns entering a move in the format of "A2 A5" where the first coordinate is the current location of the piece and the second is the target location.  The game will move the piece and rerender the board if the player enters a valid move.  

The game will run until there is a checkmate; to exit prematurely, press Control + C

## Contributing

To contribute, fork the repo and make a pull request.

Some features currently missing/defective:

* Turn/Game Logic - the application does not enforce alternating turns between black and white pieces.  It relies on the users to move the correct color during their turns
* Pawn Promotion - there is currently no method to promote pawns when they reach the opposide end of the board
* Checkmate -  currently the checkmate method only tests if there is a valid move the king can make to escape a check situation.  It does not check if the player can move another piece to break check

## License

This repo is available under a MIT license
