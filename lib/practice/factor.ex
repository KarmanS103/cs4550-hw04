# TODO: Complete Factor Method
defmodule Practice.Factor do
    def factor(x) do
        acc = []
        point = 1
        temp = factor_helper(x, acc, point)
        returnval = inspect(temp)
        returnval
    end

    def factor_helper(x, acc, point) do
        if point === x do
            acc
        else
            temp = rem(x, point)
            if temp === 0 do
                IO.puts(point)
                IO.puts(temp)
                acc = acc ++ [point]
                acc = acc ++ [div(x, point)]
                factor_helper(x, acc, point + 1)
            else
                IO.puts("here")
                factor_helper(x, acc, point + 1)
            end
        end
    end
end