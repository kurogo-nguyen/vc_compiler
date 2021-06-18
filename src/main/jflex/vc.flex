import java_cup.runtime.*;
%%

%class VC_Lexical

%unicode
//%cupsym testsym
%cup

%line
%char
%column
%function next_token
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


DIGIT = [0-9]
CHAR = [a-zA-Z]
IntegerLiteral = 0 | [1-9][0-9]*
FLOAT = {DIGIT}"."{DIGIT}*

LineTerminator = \r | \n | \r\n
WhiteSpace = {LineTerminator} | [ \t\f]
ID = [:jletter:][:jletterdigit:]*

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
    // s
      {ID}                      {return symbol(sym.ID);}
    // Literals
      {IntegerLiteral}          {return symbol(sym.INTLITERAL);}

//        {Number}           {return symbol(sym.INTLITERAL, yytext()); }

      {WhiteSpace}                {/* Do Nothing */}
        .                         {return symbol(sym.error);}
    <<EOF>>               {return symbol(sym.EOF, "EOF");}
