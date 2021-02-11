defmodule Practice.Palindrome do
    # Attribution: Nat Tuck's Lecture 6 Code
    def reverse(x) do
        x
        |> String.to_charlist
        |> Enum.reverse
        |> to_string
    end

    def palindrome?(x) do
        value = Integer.parse(x)
        IO.puts(value)
        case value do
            {:error, _} -> IO.puts("error thrown")
            _ -> x == reverse(x)
        end 
    end
end
