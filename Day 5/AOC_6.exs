defmodule partOne do
  def startup() do
    fish = String.split(File.read!("./puzzle.txt"), ",")
    fish = Enum.map(fish, &String.to_integer/1)
    forloop(fish, 80)
  end

  def forloop(list, y) do
    if y > 0 do
      list = Enum.reduce list, [], fn x, acc ->
        if (x == 0) do
          [6, 8 | acc] # faster but does not mantain list order (reverses the list back and forth)
          #acc ++ [6, 8] - if you want to maintain list order
        else
          [x - 1 | acc] # faster but does not mantain list order (reverses the list back and forth)
          #acc ++ [x - 1] - if you want to maintain list order
        end
      end

      forloop(list, y - 1)
    else
      IO.puts(Enum.count(list))
    end
  end
end
