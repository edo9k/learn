
-- lê numeros da entrada padrão
-- quando o usuário digita zero (0)
-- imprime o maior e o menor números inseridos


maior_menor maior menor = do
  putStrLn "Insira um novo numero, ou zero (0) para finalizar."

  numero <- getLine
  let numero' = read numero

  if numero' == 0 then do
    putStrLn ("Maior numero: " ++ (show maior))
    putStrLn ("Menor numero: " ++ (show menor))
  else do
    let maior' = (if numero' > maior then numero' else maior)
    let menor' = (if numero' < menor then numero' else menor)

    maior_menor maior' menor'


main = do
  putStrLn "Insira o primeor numero: "
  numero <- getLine

  let numero' = read numero

  maior_menor numero' numero' 

