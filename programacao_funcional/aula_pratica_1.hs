{-
	Aula dia 21/02/2020
-}

module AulaP1 where

-- questão 1
	inc a = a + 1
	dobro a = a + a
	quadrado a = a * a
	media a b = (a + b) / 2

-- questão 2
	triangulo a b c = a <= b + c && b <= a + c && c <= a + b

-- questão 3
	heron a b c =
		let s = (a + b + c) / 2 in
		sqrt (s * (s - a) * (s - b) * (s - c))

-- questão 4
	metades :: [a] -> ([a], [a])
	metades l =
		let x = length l in
		let xhalf = x `div` 2 in
			(take xhalf l, drop xhalf l)
	metades' l =
		(take xhalf l, drop xhalf l)
			where
				x = length l
				xhalf = x `div` 2
