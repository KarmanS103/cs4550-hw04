defmodule Practice.Palindrome do
    # Attribution: Nat Tuck's Lecture 6 Code
    def reverse(x) do
        x
        |> String.to_charlist
        |> Enum.reverse
        |> to_string
    end

    def palindrome?(x) do
        x == reverse(x)
    end
end
