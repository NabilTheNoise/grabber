# Grabber
Grabber with lexical analyzer.
It can be use to scan files and find patterns and etc.

# How To Run
  * `cd` to the destination file
  * Use flex to convert the lex file to c by typing `flex Project.l`. It will create a `lex.yy.c` file where all your flex patterns are converted to c language.
  * Use gcc to compile the file by typing `gcc lex.yy.c`. it will create an `a.exe` file. You can run it with cmd by typing `a` and pressing enter, or in powershell you can type `.\a` and press enter to run.
### short version:
  ```powershell
  flex Project.l
  gcc lex.yy.c
  .\a
  ```
# How To Use:
You can give it a file by just running `.\a text.txt` or any text file like html and etc. 
or you can just run it with `.\a n` so you can enter manualy and see the resualt.

# Formats
### URL and Email:
It can recognize any pattern of urls and emails.
### Phone Numbers:
Recognizing any formats with 3 spaces in between like `+xx xxx xxx xxxx` or `+xx-xxx-xxx-xxxx`. 
### Landline Number:
Recognizing Iran landline numbers or anything like `0xxxxxxxxx` or `0xxxxxxxxxx`
### National Code:
Only Iran National Code will be recognized.
### Date:
Anything separated by `: / \ -` and has 3 parts of digits will be recognized.
### Time:
Any standard format of time will be recognized.
### Binary and Decimal Numbers:
Any binary and decimal number will be recognized.
### Hexadecimal Colors:
Any pattern starting with `#` and having 6 hexa digits will be recognized as Hex Colors.
### IP Addresses(ipv4 and ipv6):
All IPs can be recognized whether they are ipv4 or ipv6.
### MAC address:
Using standard mac address format.
### Postal Code:
Only Iran Postal code can be recognized.
### Path in Windows:
Can be recognize easily :D
### File Names:
Using standard format like `name.extention`.
### Special Words:
The program is sensitive to some words.
### Polynomial:
Identifiers can be x,y,z,n and it uses the standard polynomial format to recognize.
### Fraction:
Any kind of fraction it can recognize.

### Have Fun!
Help me improve the lex analyser :D
