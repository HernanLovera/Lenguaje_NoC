import java.io.FileReader;
import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) {
        try {
            // Primera pasada: solo lexema por lexema para ver tokens
            AnalizadorLexico lex = new AnalizadorLexico(new FileReader("entrada.txt"));
            System.out.println("==== TOKENS ====");
            Symbol s;
            while ((s = lex.next_token()).sym != sym.EOF) {
                String lexema = lex.yytext();
                String nombre = sym.terminalNames[s.sym];
                System.out.printf("%-15s | lexema: '%s'%n", nombre, lexema);
            }

            // Segunda pasada: reiniciamos el lexer y lanzamos el parser en modo debug
            lex.yyreset(new FileReader("entrada.txt"));
            parser p = new parser(lex);

            System.out.println("\n==== ANÁLISIS SINTÁCTICO (traza) ====");
            try {
                // debug_parse muestra desplazamientos y reducciones
                p.debug_parse();
                System.out.println("✅ Análisis sintáctico OK.");
            } catch (Exception e) {
                // Aquí CUP ya habrá impreso mensajes de report_error con línea/columna si lo configuraste.
                System.err.println("❌ Se produjo un error durante el parseo.");
                e.printStackTrace();
            }
        } catch (Exception e) {
            System.err.println("Error general en Main:");
            e.printStackTrace();
        }
    }
}