# CSE3120 Contest 1

A text maze game written in MASM with the Irvine32 library. Pick up every
key (K), then walk onto the exit (E) before your moves run out. Walls (#)
block the way and do not cost a move.

Team members:

- Nicholas Dunzelman
- Nicholas Welsh

## How to play

Move with w (up), a (left), s (down) and d (right). Press q to quit.

## How to compile and run

1. Install the Irvine32 library in C:\Irvine.
2. Open the "x86 Native Tools Command Prompt for VS" in this folder.
3. Run build.bat. It assembles the four .asm files and links MazeGame.exe.
4. Run MazeGame.exe.

## Relevance

This is a small console game, so its effect on the world is indirect, but
the idea behind it is a real one. Picking up every key and then reaching the
exit before the moves run out is the same planning people need to get out of
a building in an emergency. People need to know the layout, get what is only
needed, and take the shortest safe route while there is still time. That
ties the game to public safety and welfare, and the move limit makes it
practice at planning under pressure.

The game needs nothing beyond a Windows console, with no graphics, sound or
network, so it runs on old and inexpensive computers and costs nothing to
share, which helps socially and economically. The only words on screen are a
few short English messages, so adapting it for other languages and cultures
means changing just those strings. Its environmental footprint is the small
amount of power a text program uses.
