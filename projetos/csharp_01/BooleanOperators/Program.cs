using System;

namespace BooleanOperators
{
    public class Program
    {
        private static Action<string> methodInvoke;

        private static void Main(string[] args)
        {
            methodInvoke = (string text) =>
            {
                Console.WriteLine(text);
                Console.WriteLine("\t--- Método Teste1 ---");

                Teste1();

                Console.WriteLine("\n");
                Console.WriteLine("\t--- Método Teste2 ---");

                Teste2();
            };

            Extra();

            Console.ReadKey();
        }

        private static void Extra() => methodInvoke.Invoke("Invoque o método embutido!\n");

        private static void Teste2()
        {
            string notNullString = "A";
            string nullString = null;
            var a = true;
            var b = false;
            var c = 1 + 3 <= 4;
            var d = 7 * 15 == 153;
            var e = a && b;
            var f = c || d;
            var g = !(e && f) || (!e && (d || f)) ? 100 : -100;
            var h = nullString ?? notNullString;

            Console.WriteLine($"a: {a}");
            Console.WriteLine($"b: {b}");
            Console.WriteLine($"c: {c}");
            Console.WriteLine($"d: {d}");
            Console.WriteLine($"e: {e}");
            Console.WriteLine($"f: {f}\n");
            Console.WriteLine($"Igualdade (a / b): {a.Igualdade(b)}");
            Console.WriteLine($"Desigualdade (a / b): {a.Desigualdade(b)}");
            Console.WriteLine($"Igualdade (c / d): {c.Igualdade(d)}");
            Console.WriteLine($"Desigualdade (c / d): {c.Desigualdade(d)}");
            Console.WriteLine($"g = {g}");
            Console.WriteLine($"h = '{h}'");
        }

        public static void Teste1()
        {
            var a = 10;
            var b = 5;

            Console.WriteLine($"a: {a}");
            Console.WriteLine($"b: {b}\n");
            Console.WriteLine($"Soma: {a.Soma(b)}");
            Console.WriteLine($"Subtração: {a.Subtracao(b)}");
            Console.WriteLine($"Multiplicação: {a.Multiplicacao(b)}");
            Console.WriteLine($"Divisão: {a.Divisao(b)}");
            Console.WriteLine($"Incrementar 1: {a.Incrementar1(b)}");
            Console.WriteLine($"Incrementar 2: {a.Incrementar2()}");
            Console.WriteLine($"Incrementar 3: {a.Incrementar3()}");
            Console.WriteLine($"Decrementar 1: {a.Decrementar1(b)}");
            Console.WriteLine($"Decrementar 2: {a.Decrementar2()}");
            Console.WriteLine($"Decrementar 3: {a.Decrementar3()}");
            Console.WriteLine($"Multiplicação 1: {a.Multiplicacao1(b)}");
            Console.WriteLine($"Divisão 1: {a.Divisao1(b)}");
        }
    }
}