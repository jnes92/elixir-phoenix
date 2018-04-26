defmodule Cards do

  # implicit return : last used value inside method is returned
  # iex -S mix : start the interactive shell (write recompile for restart)
  def create_deck do
    ["Ace","Two","Three"] # double quotes, single quotes is support, but not common
  end

  def shuffle(deck) do
      Enum.shuffle(deck)
  end

  def contains?(deck, card) do
      Enum.member?(deck,card)
  end
end
