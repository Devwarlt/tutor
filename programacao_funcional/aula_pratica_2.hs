{-
	Aula dia 21/02/2020
	URL: https://www.dcc.fc.up.pt/~sandra/Home/PF1920_files/exercicios.pdf
-}

module AulaP2 where

{-
	Adicionar novo alias para um tipo que já existe me Haskell
	type Tipo = (Int, Int)
-}

-- questão 14
{-
	a) ['a','b','c'] :: [Char]
	b) ('a','b','c') :: (Char,Char,Char)	
	c) [(False,'0'),(True,'1')] :: [(Bool,Char)]
	d) ([False, True], ['0', '1']) :: ([Bool,Char])
	e) [tail, init, reverse] :: [[a] -> [a]]
	f) [id, not] :: [Bool -> Bool]
-}

-- questão 15
{-
	1. Num a => Num b => (a, b) => Int
	2. Num a => a -> b -> Int
	3. a -> Num -> Int
	4. a -> [Num] -> [Int]
	5. Num a => Num b => (a, b) -> [Int, Int]
-}

-- questão 16
{-
	f :: Num a => b -> [a -> [Int]]
	g :: a
-}

-- questão 17
{-
	a) tail :: [a] -> [a]
	head :: [a] -> a
	segundo :: [a] -> a
	
	b) trocar :: (a, b) -> (b, a)
	c) par :: a -> b -> (a, b)
	d) dobro :: Num a => a -> a
	e) metade :: Fractional a => a -> a
	f) minuscula :: Character a => a -> Bool
	g) intervalo :: Ord a => a -> a -> a -> Bool
	h) palindromo :: Eq a => [a] -> Bool
	i) twice :: a -> a
-}
