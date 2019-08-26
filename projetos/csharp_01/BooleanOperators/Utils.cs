namespace BooleanOperators
{
    public static class Utils
    {
        public static int Soma(this int a, int b) => a + b;

        public static int Subtracao(this int a, int b) => a - b;

        public static int Multiplicacao(this int a, int b) => a * b;

        public static int Divisao(this int a, int b) => a / b;

        public static int Incrementar1(this int a, int b) => a += b;

        public static int Incrementar2(this int a) => a++;

        public static int Incrementar3(this int a) => ++a;

        public static int Decrementar1(this int a, int b) => a -= b;

        public static int Decrementar2(this int a) => a--;

        public static int Decrementar3(this int a) => --a;

        public static int Multiplicacao1(this int a, int b) => a *= b;

        public static int Divisao1(this int a, int b) => a /= b;
    }
}