defmodule Practice.Factor do
    def factor(num) do 
        fact(num, num, 2, [])
    end
    
    # Need to keep track of the starting number in case it's prime 
    def fact(start, num, lb, acc) when num <= 1 do
        [head | tail] = acc
        # If the number is prime, the accumulator will be empty so we need to just return the 
        # starting number
        if tail == [] do
            [start]
        else
            acc
        end
    end

    def fact(start, num, lb, acc) do
        if rem(num, lb) == 0 do
            acc = acc ++ [lb]
            fact(start, round(num/lb), lb, acc)
        else 
            lb = lb + 1
            fact(start, num, lb, acc)
        end
    end
end