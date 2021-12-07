defmodule PartOne do
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

defmodule PartTwo do
  def startup() do
    fish = String.split(File.read!("./puzzle.txt"), ",")
    fish = Enum.map(fish, &String.to_integer/1)
    fish = Enum.frequencies(fish)
    fish = (Map.merge(%{0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0}, fish))

    forloop(fish, 256)
  end

  def forloop(list, y) do
    if y > 0 do
      list = Map.replace(list, 7, elem(Map.fetch(list, 0), 1) + elem(Map.fetch(list, 7), 1))
      list = for {k, v} <- list, into: %{} do
        if (k == 0) do
          {k + 8, v}
        else
          {k - 1, v}
        end
      end

      forloop(list, y - 1)
    else
      IO.puts(Enum.sum(Map.values(list)))
    end
  end
end
