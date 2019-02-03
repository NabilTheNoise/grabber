# Grabber
Grabber with lexical analyzer.
it can be use to scan files and find patterns and etc.

# How to run
  * `cd` to the destination file
  * use flex to convert the lex file to c by typing `flex Project.l`. it will create a `lex.yy.c` file where all your flex patterns are converted to c language.
  * use gcc to compile the file by typing `gcc lex.yy.c`. it will create an `a.exe` file. you can run it with cmd by typing `a` and pressing enter, or in powershell you can type `.\a` and press enter to run.
### short version:
  ```powershell
  flex Project.l
  gcc lex.yy.c
  .\a
  ```
  
# Formats
