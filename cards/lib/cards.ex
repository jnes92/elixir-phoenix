defmodule Cards do
  # implicit return : last used value inside method is returned
  # iex -S mix : start the interactive shell (write recompile for restart)
  def create_deck do
    # double quotes, single quotes is support, but not common
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # Solution 1:
    # List.flatten(for value <- values do
    #  for suit <- suits do
    #    "#{value} of #{suit}"
    #  end
    # end)

    # Solution 2: 
    for suit <- suits,
        value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "That file does not exist"
    end
  end
end
