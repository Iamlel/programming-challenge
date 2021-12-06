def partOne()
  file = File.read("puzzle.txt").split
  tot = 0
  for x in 1..(file.length() - 1)
    if file[x].to_i > file[x - 1].to_i
      tot += 1
    end
  end
  puts tot
end

def partTwo()
  file = File.read("puzzle2.txt").split
  tot = 0
  prev = file[0].to_i + file[1].to_i + file[2].to_i
  for x in 1..(file.length() - 1)
    now = file[x].to_i + file[x + 1].to_i + file[x + 2].to_i
    if now > prev
      tot += 1
    end
    prev = now
  end
  puts tot
end

partTwo()
