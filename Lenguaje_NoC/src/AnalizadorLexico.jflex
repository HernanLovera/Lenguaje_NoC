import java_cup.runtime.*;

%%
%public
%class AnalizadorLexico
%unicode
%cup
%line
%column
%%

\uFEFF      { /* ignorar BOM */ }

/* ==== Palabras reservadas ==== */
"inicio"        { return new Symbol(sym.INICIO); }
"retorno"       { return new Symbol(sym.RETORNO); }
"saltear"       { return new Symbol(sym.SALTEAR); }
"continuar"     { return new Symbol(sym.CONTINUAR); }
"encasode"      { return new Symbol(sym.ENCASODE); }
"caso"          { return new Symbol(sym.CASO); }
"defecto"       { return new Symbol(sym.DEFECTO); }
"const"         { return new Symbol(sym.CONST); }
"hacer"         { return new Symbol(sym.HACER); }
"si"            { return new Symbol(sym.SI); }
"sino"          { return new Symbol(sym.SINO); }
"para"          { return new Symbol(sym.PARA); }
"ira"           { return new Symbol(sym.IRA); }
"estruct"       { return new Symbol(sym.ESTRUCT); }
"tipodef"       { return new Symbol(sym.TIPODEF); }
"mientras"      { return new Symbol(sym.MIENTRAS); }
"vacio"         { return new Symbol(sym.VACIO); }
"mostrar"       { return new Symbol(sym.MOSTRAR); }
"hasta"         { return new Symbol(sym.HASTA); }

"decimal"       { return new Symbol(sym.DECIMAL); }
"entero"        { return new Symbol(sym.ENTERO); }
"texto"         { return new Symbol(sym.TEXTO); }
"booleano"      { return new Symbol(sym.BOOLEANO); }

/* ==== Operadores y símbolos ==== */
"="             { return new Symbol(sym.ASIGNACION); }
"=="            { return new Symbol(sym.IGUALIGUAL); }
"!="            { return new Symbol(sym.DISTINTO); }
"<"             { return new Symbol(sym.MENOR); }
">"             { return new Symbol(sym.MAYOR); }

"+="            { return new Symbol(sym.MASIGUAL); }
"/="            { return new Symbol(sym.DIVIGUAL); }
"*="            { return new Symbol(sym.PORIGUAL); }

"+"             { return new Symbol(sym.MAS); }
"-"             { return new Symbol(sym.MENOS); }
"*"             { return new Symbol(sym.POR); }
"/"             { return new Symbol(sym.DIV); }

"("             { return new Symbol(sym.LPAR); }
")"             { return new Symbol(sym.RPAR); }
"["             { return new Symbol(sym.LBRACK); }
"]"             { return new Symbol(sym.RBRACK); }
"{"             { return new Symbol(sym.LLLAVE); }
"}"             { return new Symbol(sym.RLLAVE); }
","             { return new Symbol(sym.COMA); }
";"             { return new Symbol(sym.PUNTOYCOMA); }
":"             { return new Symbol(sym.DOSPUNTOS); }
"."             { return new Symbol(sym.PUNTO); }

"&"             { return new Symbol(sym.Y); }
"|"             { return new Symbol(sym.O); }

/* ==== Constantes ==== */
-?[0-9]+        { return new Symbol(sym.NUM, yytext()); }

/* ==== Cadenas ==== */
\"([^\\\"]|\\.)*\"   { return new Symbol(sym.CADENA, yytext()); }

/* ==== Comentarios ==== */
"//".*          { /* comentario de una línea, ignorar */ }

/* ==== Identificadores ==== */
[a-zA-Z_][a-zA-Z0-9_]*  { return new Symbol(sym.ID, yytext()); }

/* ==== Ignorar espacios en blanco y saltos de línea ==== */
[ \t\r\n]+      { /* ignorar */ }

/* ==== Caracteres no reconocidos ==== */
.               { System.err.println("Caracter no reconocido: " + yytext()); return null; }