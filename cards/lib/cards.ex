defmodule Cards do

  # implicit return : last used value inside method is returned
  # iex -S mix : start the interactive shell (write recompile for restart)
  def create_deck do
    values = ["Ace","Two","Three","Four","Five"] # double quotes, single quotes is support, but not common
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits do
      suit
    end
  end

  def shuffle(deck) do
      Enum.shuffle(deck)
  end

  def contains?(deck, card) do
      Enum.member?(deck,card)
  end
end
