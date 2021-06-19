import java_cup.runtime.*;
%%

%class VC_Lexical

%unicode
//%cupsym testsym
%cup

%line
%char
%column
//%function next_token
%type VCToken
//%debug

%{
    boolean hasMainFunc = false;
    private VCToken symbol(int type) {
        return new VCToken(type, yytext(), yyline, yycolumn);
    }

    private VCToken symbol(int type, Object value) {
        return new VCToken(type, value, yyline, yycolumn);
    }
%}


Digit = [0-9]
Letter = [a-zA-Z_]

Identifier = {Letter} ({Letter} | {Digit})*
IntLiteral = {Digit} {Digit}*
/* floating point literals */
FloatLiteral = {Digit}+ "."
              | {Digit}* {Fraction} {Exponent}?
              | {Digit}+ {Exponent}


Fraction = \. {Digit}+
Exponent = [eE] [+-]? {Digit}+

LineTerminator = \r | \n | \r\n
WhiteSpace = {LineTerminator} | [ \t\f]

/*Comment*/
TraditonalComment = "/*"~"*/"
EndOfLineComment = "//" [^\n\r]*
Comment = {TraditonalComment} | {EndOfLineComment}

/* String */
String = \"(\\.|[^\"])*\"

%eofval{
  return symbol(sym.EOF);
%eofval}

%state func

%%
    // Keywords
      "if"                      {return symbol(sym.IF);}
      "else"                    {return symbol(sym.ELSE);}
      "for"                     {return symbol(sym.FOR);}
      "while"                   {return symbol(sym.WHILE);}
      "break"                   {return symbol(sym.BREAK);}
      "continue"                {return symbol(sym.CONTINUE);}
      "return"                  {return symbol(sym.RETURN);}
      "main"                    {return symbol(sym.ID);}

    // Types
      "void"                    {return symbol(sym.VOID);}
      "boolean"                 {return symbol(sym.BOOLEAN);}
      "int"                     {return symbol(sym.INT);}
      "float"                   {return symbol(sym.FLOAT);}

    // Operators
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
    // Separators
      "{"                       {return symbol(sym.LBRACE);}
      "}"                       {return symbol(sym.RBRACE);}
      "["                       {return symbol(sym.LBRACK);}
      "]"                       {return symbol(sym.RBRACK);}
      "("                       {return symbol(sym.LPAREN);}
      ")"                       {return symbol(sym.RPAREN);}
      ";"                       {return symbol(sym.SEMI);}
      ","                       {return symbol(sym.COMMA);}
    // Literals
      {IntLiteral}              {return symbol(sym.INTLITERAL);}
      {FloatLiteral}            {return symbol(sym.FLOATLITERAL);}
      "true"                    {return symbol(sym.BOOLLITERAL);}
      "false"                   {return symbol(sym.BOOLLITERAL);}
      // s
      {Comment}                 {System.out.println(symbol(sym.COMMENT).toString());}
      {String}                  {return symbol(sym.STRINGLITERAL);}
      {Identifier}              {return symbol(sym.ID);}
      {WhiteSpace}              {/* Do Nothing */}
      .                         {return symbol(sym.error);}

