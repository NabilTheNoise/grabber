%{
    #include <windows.h>
    #include <stdio.h>

    void color(int i){
        HANDLE text_color = GetStdHandle( STD_OUTPUT_HANDLE );
        SetConsoleTextAttribute(text_color, i);
        }

    void cprint(char input[], char* yytext){
    color(12);
    printf("%s: ", input);
    color(6);
    printf("%s\n", yytext);
    color(7);
    }
    
    void Warning(char input1[], char* yytext, char input2[]){
        color(100);
        printf("Warning! ");
        color(12);
        printf("%s: ", input1);
        color(6);
        printf("%s %s\n", yytext, input2);
        color(7);
    }

    int COUNTER_URL = 0;
    int COUNTER_EMAIL = 0;
    int COUNTER_PHONE = 0;
    int COUNTER_LANDLINE = 0;
    int COUNTER_NATIONAL_CODE = 0;
    int COUNTER_DATE = 0;
    int COUNTER_BINARY = 0;
    int COUNTER_DECIMAL = 0;
    int COUNTER_HEX_COLOR = 0;
    int COUNTER_IPV4 = 0;
    int COUNTER_IPV6 = 0;
    int COUNTER_MAC = 0;
    int COUNTER_POSTAL_CODE = 0;
    int COUNTER_HTML_TAGS = 0;
    int COUNTER_TIME = 0;
    int COUNTER_PATH = 0;
    int COUNTER_FILES = 0;
    int COUNTER_SPECIAL_WORDS = 0;
    int COUNTER_POLYNOMIAL = 0;
    int COUNTER_FRACTION = 0;
    
    void print_counter(char input[], int number){
        color(3);
        printf("%s", input);
        color(1);
        printf("s Found: ");
        color(5);
        printf("%d\n", number);
        color(7);
    }



%}

alphanum    [0-9a-zA-Z]
capital     [A-Z]
small       [a-z]
digit       [0-9]
nonziro     [1-9]
letter      [A-Za-z]
pchar       [!#$%&'*+-=?^_`{|}~]
space       [ ]
dash        [-]
binary      [01]
hex         [0-9A-Fa-f]
ipv4        ({digit}|1{digit}{digit}|2[0-4]{digit}|25[0-5])
ipv6        ({hex}{hex}{hex}{hex})
mac         ({hex}{hex})
nfile       [\/:*?"<>|]
file        [a-zA-Z0-9(),.]
polynomial  [()^xXyYzZnN0-9+-]
polynomial2 [xX^0-9()]


%%
    /* *yytext = SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ), FOREGROUND_BLUE); */
    /* if no pattern found, it will skip*/
.
    /* this is for newlines */
\n
    /* URL */
(http|https):\/\/({letter}*\.)?({alphanum})+\.{letter}+$ {
    cprint("URL", yytext);
    COUNTER_URL++;
    }

    /* Email formats: */
({alphanum})+({alphanum}+"."?)*({alphanum})+"@"{letter}+\.{letter}+$ {
    cprint("Email", yytext);
    COUNTER_EMAIL++;
    }

    /* email pattern with " this " and pchar */
\"({alphanum}|{pchar}|\.|{space})+\""@"({alphanum})+\.{letter}+$ {
    cprint("Email", yytext);
    COUNTER_EMAIL++;
    }

    /* Phone numbers */
"+"{digit}+[ -]{digit}+([ -]{digit}+)?[ -]{digit}+[ -]{digit}{digit}{digit}{digit} {
    cprint("Phone Number", yytext);
    COUNTER_PHONE++;
    }

    /* Landline number */
"0"{digit}{digit}{digit}{digit}{digit}{digit}{digit}{digit}{digit}{digit}? {
    cprint("Landline Number", yytext);
    COUNTER_LANDLINE++;
    }

    /* National Code */
{digit}{digit}{digit}"-"{digit}{digit}{digit}{digit}{digit}{digit}"-"{digit} {
    cprint("National Code", yytext);
    COUNTER_NATIONAL_CODE++;
    }

    /* Date */
{digit}{digit}?({digit}{digit})?[:\/\\-]{digit}{digit}?({digit}{digit})?[:\/\\-]{digit}{digit}?({digit}{digit})? {
    cprint("Date", yytext);
    COUNTER_DATE++;
    }

    /* Binary numbers */
{binary}+$ {
    cprint("Binary Number", yytext);
    COUNTER_BINARY++;
    }

    /* Decimal numbers */
{digit}+$ {
    cprint("Decimal Number", yytext);
    COUNTER_DECIMAL++;
    }

    /* Hexadecimal Colors */
"#"{hex}{hex}{hex}{hex}{hex}{hex} {
    cprint("Hexadecimal Color", yytext);
    COUNTER_HEX_COLOR++;
    }

    /* IP Address */
    /* ipv4 */
{ipv4}\.(({ipv4}("-"{ipv4})?)|"*")\.(({ipv4}("-"{ipv4})?)|"*")\.(({ipv4}("-"{ipv4})?)|"*") {
    cprint("IP Address (ipv4)", yytext);
    COUNTER_IPV4++;
    }

    /* ipv6 */
{ipv6}?":"{ipv6}?":"{ipv6}?":"{ipv6}?":"{ipv6}?":"{ipv6}?":"{ipv6}?":"{ipv6}? {
    cprint("IP Address (ipv6)", yytext);
    COUNTER_IPV6++;
    }

    /* Macaddress */
{mac}(":"|"-")?{mac}(":"|"-")?{mac}(":"|"-")?{mac}(":"|"-")?{mac}(":"|"-")?{mac} {
    cprint("Physical Address (MAC)", yytext);
    COUNTER_MAC++;
    }

    /* Postal code */
{digit}{5}"-"{digit}{5} {
    cprint("Postal Code", yytext);
    COUNTER_POSTAL_CODE++;
    }

    /* HTML tags */
"<"[\/]?({letter}|{digit})+">" {
    cprint("HTML", yytext);
    COUNTER_HTML_TAGS++;
    }

    /* Time */
{digit}{digit}?":"{digit}{digit}?(":"{digit}{digit})?(" ")?(AM|am|PM|pm|Am|Pm)? {
    cprint("Time", yytext);
    COUNTER_TIME++;
    }

    /* Path in windows */
{capital}":\\" {
    cprint("Windows Path", yytext);
    COUNTER_PATH++;
    }

{capital}":"(\\({letter}|{space})+)* {
    cprint("Windows Path", yytext);
    COUNTER_PATH++;
    }

    /* File name */
^({file}|{pchar})+\.({file}|{pchar})* {
    cprint("File Name", yytext);
    COUNTER_FILES++;
    }

    /* Special Words */
[oO][iI][lL] {Warning("Reporting Special Word", yytext, "Found!");COUNTER_SPECIAL_WORDS++;}
[gG][oO][dD] {Warning("Reporting Special Word", yytext, "Found!");COUNTER_SPECIAL_WORDS++;}
[iI][rR][aA][nN] {Warning("Reporting Special Word", yytext, "Found!");COUNTER_SPECIAL_WORDS++;}
[aA][lL][lL][aA][hH] {Warning("Reporting Special Word", yytext, "Found!");COUNTER_SPECIAL_WORDS++;}
[lL][eE][aA][dD][eE][rR] {Warning("Reporting Special Word", yytext, "Found!");COUNTER_SPECIAL_WORDS++;}
[cC][oO][mM][pP][iI][lL][eE][rR] {Warning("Reporting Special Word", yytext, "Found!");COUNTER_SPECIAL_WORDS++;}
[pP][rR][eE][sS][iI][dD][eE][nN][tT] {Warning("Reporting Special Word", yytext, "Found!");COUNTER_SPECIAL_WORDS++;}

    /* Polynomial */
(("+"|"-")?({digit}*{letter}"^"{digit}*|{digit}+))+ {
    cprint("Polynomial", yytext);
    COUNTER_POLYNOMIAL++;
    }

    /* Fraction ("("?((+|-)?{digit}\/{nonziro})+")"?("*"|\/)?)+*/
("("?(("+"|"-")?{digit}\/{nonziro})+")"?("*"|\/)?)+ {
    cprint("Fraction", yytext);
    COUNTER_FRACTION++;
    }


%%


int yywrap(void){
    return 1;
}



int main(int argc, char** argv){
    HANDLE text_color = GetStdHandle( STD_OUTPUT_HANDLE );
    if(argv[1]==NULL){
        color(6);
        printf("\n\n\tWelcome to the Lex analizer.");
        printf("\n\n\tEnter the link or file path and file name to run.\n\t\tExample: .\\a text.txt\n\n\n");
        color(7);
    }
    else if(argv[1]=="n") {
        yylex();
        return 0;
    }
    else{
        system("cls");
        color(11);
        printf("Grabber found these patterns:\n");
        color(10);
        yyin = fopen(argv[1], "r");
        yylex();
        fclose(yyin);
        color(10);


        printf("--------------------   %s   --------------------\n", "Counter List");
        color(7);
        print_counter("Url", COUNTER_URL);
        print_counter("Email", COUNTER_EMAIL);
        print_counter("Phone Number", COUNTER_PHONE);
        print_counter("Landline Number", COUNTER_LANDLINE);
        print_counter("National Code", COUNTER_NATIONAL_CODE);
        print_counter("Date Format", COUNTER_DATE);
        print_counter("Binary Number", COUNTER_BINARY);
        print_counter("Decimal Number", COUNTER_DECIMAL);
        print_counter("Hexadecimal Color", COUNTER_HEX_COLOR);
        print_counter("IPV4", COUNTER_IPV4);
        print_counter("IPV6", COUNTER_IPV6);
        print_counter("MAC Address", COUNTER_MAC);
        print_counter("Postal Code", COUNTER_POSTAL_CODE);
        print_counter("HTML Tag", COUNTER_HTML_TAGS);
        print_counter("Time Format", COUNTER_TIME);
        print_counter("Windows Path", COUNTER_PATH);
        print_counter("File", COUNTER_FILES);
        print_counter("Special Word", COUNTER_SPECIAL_WORDS);
        print_counter("Polynomial", COUNTER_POLYNOMIAL);
        print_counter("Fraction", COUNTER_FRACTION);

        color(7);
    }
    return 0;
}