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
# How to use:
you can give it a file by just running `.\a text.txt` or any text file like html and etc. 
or you can just run it with `.\a n` so you can enter manualy and see the resualt.

# Formats
### URL and Email:
it can recognize any pattern of urls and emails.
### Phone Numbers:
recognizing any formats with 3 spaces in between like `+xx xxx xxx xxxx` or `+xx-xxx-xxx-xxxx`. 
### Landline Number:
recognizing Iran landline numbers or anything like `0xxxxxxxxx` or `0xxxxxxxxxx`
### National Code:
only Iran National Code will be recognized.
### Date:
anything separated by `: / \ -` and has 3 parts of digits will be recognized.
### Time:
any standard format of time will be recognized.
### Binary and Decimal Numbers:
any binary and decimal number will be recognized.
### Hexadecimal Colors:
any pattern starting with `#` and having 6 hexa digits will be recognized as Hex Colors.
### IP Addresses(ipv4 and ipv6):
all IPs can be recognized as they are ipv4 or ipv6.
### MAC address:
using standard mac address format.
### Postal Code:
Iran Postal code can be recognized only.
### Path in Windows:
can be recognize easily :D
### File Names:
using standard format like `name.extention`.
### Special Words:
the program is sensitive to some words.
### Polynomial:
identifiers can be x,y,z,n and it uses the standart polynomial format to recognize.
### Fraction:
any kind of fraction it can recognize.

### Have Fun!
help me improve the lex analyser :D
