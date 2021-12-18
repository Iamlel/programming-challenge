for list action = mapM_ action list

main = do
  let num = 0
  let starts = False
  let total = 0

  file <- readFile "main.hs"
  for [0..(length file)] (\ i -> do
    print (1)
    )
