
%%

%class VC_Lexical

%unicode

%cup
%type VCToken

%{
    private VCToken symbol(int type) {
        return new VCToken(type, yytext());
    }
    private VCToken symbol(int type, String str){
        return new VCToken(type, str.substring(1, str.length()-2));
    }

    private VCToken symbol(int type, Object value) {
        return new VCToken(type, value, yytext());
    }
%}

Digit = [0-9]
Letter = [a-zA-Z_]

/* Identifier */
Identifier = {Letter} ({Letter} | {Digit})*

/* Int literal*/
IntLiteral = {Digit} {Digit}*

/* Float literals */
FloatLiteral = {Digit}* {Fraction} {Exponent}?
              | {Digit}+ \.? {Exponent}
              | {Digit}+ "."

Fraction = \. {Digit}+
Exponent = [eE] [+-]? {Digit}+

/* Bool literals*/
BooleanLiteral = "true"|"false"

/* String */
EscapeSequences = "\\t"|"\\f"|"\\n"|"\\r"|"\\b"|"\\'"|"\\"| "\\\"" | \t | \f
String = \" ({Letter}|{WhiteSpace}| {EscapeSequences})*\"

/* Separated */
LineTerminator = \r | \n | \r\n
WhiteSpace = {LineTerminator} | [ \t\f]

/*Comment*/
TraditonalComment = "/*"~"*/"
EndOfLineComment = "//" [^\n\r]*
Comment = {TraditonalComment} | {EndOfLineComment}

%%
    /* Keywords */
    "if"                      {return symbol(sym.IF);}
    "else"                    {return symbol(sym.ELSE);}
    "for"                     {return symbol(sym.FOR);}
    "while"                   {return symbol(sym.WHILE);}
    "break"                   {return symbol(sym.BREAK);}
    "continue"                {return symbol(sym.CONTINUE);}
    "return"                  {return symbol(sym.RETURN);}
    "main"                    {return symbol(sym.ID);}

    /* Types */
    "void"                    {return symbol(sym.VOID);}
    "boolean"                 {return symbol(sym.BOOLEAN);}
    "int"                     {return symbol(sym.INT);}
    "float"                   {return symbol(sym.FLOAT);}

    /* Operators */
    "+"                       {return symbol(sym.PLUS);}
    "-"                       {return symbol(sym.MINUS);}
    "*"                       {return symbol(sym.TIMES);}
    "/"                       {return symbol(sym.DIV);}
    "="                       {return symbol(sym.EQ);}
    "=="                      {return symbol(sym.EQEQ);}
    "!="                      {return symbol(sym.NOTEQ);}
    "||"                      {return symbol(sym.OROR);}
    "&&"                      {return symbol(sym.ANDAND);}
    "!"                       {return symbol(sym.NOT);}
    ">"                       {return symbol(sym.GT);}
    "<"                       {return symbol(sym.LT);}
    ">="                      {return symbol(sym.GTEQ);}
    "<="                      {return symbol(sym.LTEQ);}

    /* Separators */
    "{"                       {return symbol(sym.LBRACE);}
    "}"                       {return symbol(sym.RBRACE);}
    "["                       {return symbol(sym.LBRACK);}
    "]"                       {return symbol(sym.RBRACK);}
    "("                       {return symbol(sym.LPAREN);}
    ")"                       {return symbol(sym.RPAREN);}
    ";"                       {return symbol(sym.SEMI);}
    ","                       {return symbol(sym.COMMA);}

    /* Literals */
    {IntLiteral}              {return symbol(sym.INTLITERAL, Integer.valueOf(yytext()));}
    {FloatLiteral}            {return symbol(sym.FLOATLITERAL, Float.valueOf(yytext()));}
    {BooleanLiteral}          {return symbol(sym.BOOLLITERAL, Boolean.valueOf(yytext()));}
    {String}                  {return symbol(sym.STRINGLITERAL, yytext());}

    /* Identifier */
    {Identifier}              {return symbol(sym.ID);}

    // Separated
    {Comment}|{WhiteSpace}    {/* Do Nothing */}
    <<EOF>>                   {return symbol(sym.EOF);}
    .                         {return symbol(sym.error);}

