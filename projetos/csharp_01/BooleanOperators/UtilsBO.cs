namespace BooleanOperators
{
    public static class UtilsBO
    {
        public static bool Igualdade(this bool a, bool b) => a == b;

        public static bool Desigualdade(this bool a, bool b) => a != b;
    }

    /*
     * Tabela verdade AND (E): operador &&
     *
     * a    b   a && b
     * v    v   v
     * v    f   f
     * f    v   f
     * f    f   f
     *
     * v: 1
     * f: 0
     *
     * 0    0   0
     * 0    1   0
     * 1    0   0
     * 1    1   1
     */

    /*
     * Tabela verdade OR (OU): operador ||
     *
     * a    b   a || b
     * v    v   v
     * v    f   v
     * f    v   v
     * f    f   f
     *
     * v: 1
     * f: 0
     *
     * 0    0   0
     * 0    1   1
     * 1    0   1
     * 1    1   1
     */
}