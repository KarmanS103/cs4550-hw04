defmodule Practice.Calc do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def evaluate(prefix) do
    evaluate_helper(prefix, [])
  end

  def evaluate_helper(prefix, numbers) do
    if prefix == [] do
      IO.puts(inspect(numbers))
      [head | tail] = numbers
      head
    else 
      [head | tail] = prefix
      case head do
        {:op, token} -> evaluate_helper(tail, get_number(token, numbers))
        {:num, token} -> evaluate_helper(tail, numbers ++ [token])
      end
    end
  end

  def get_number(operator, numbers) do
    [first | second] = numbers
    [second | third] = second
    {first_num, _} = Integer.parse(first)
    {second_num, _} = Integer.parse(second)
    cond do 
      operator == "+" -> 
        [first_num + second_num]
      operator == "-" ->
        [first_num - second_num]
      operator == "/" ->
        [first_num / second_num]
        operator == "*" ->
          [first_num * second_num]
    end 
  end

  def get_value(value) do
    {num, _} = Integer.parse(value)
    num
  end

  # Design Decisions:
  # If there are not spaces between operators and operands, the function will not work
  #     i.e. the user must input "2 + 2" not "2+2"
  def calc(expr) do
    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.

    temp = String.split(expr, " ")
    temp = Enum.map(temp, &tag_tokens/1)

    [head | tail] = temp
    if tail == [] do
      case head do 
        {:num, value} -> get_value(value)
      end
    else
      temp = to_postfix(temp)
      final_value = evaluate(temp)
      final_value
    end

    # Hint:
    # expr
    # |> split
    # |> tag_tokens  (e.g. [+, 1] => [{:op, "+"}, {:num, 1.0}]
    # |> convert to postfix
    # |> reverse to prefix
    # |> evaluate as a stack calculator using pattern matching
  end

  def to_postfix(expr) do 
    to_postfix_helper(expr, [], [])
  end

  def to_postfix_helper(expr, output, operators) do
    if expr == [] do
      output ++ Enum.reverse(operators)
    else 
      [head | tail] = expr
      case head do 
        {:op, token} -> to_postfix_helper(tail, get_output(token, output, operators), get_operators(token, output, operators))
        {:num, token} -> to_postfix_helper(tail, output ++ [head], operators)
      end
    end
  end

  def get_output(token, output, operators) do
    if operators == [] do 
      output
    end 
  end

  def get_operators(token, output, operators) do 
    if operators == [] do 
      operators ++ [{:op, token}]
    end 
  end

  def tag_tokens(token) do
    if token == "+" or token == "-" or token == "/" or token == "*" do 
      {:op, token}
    else 
      {:num, token}
    end
  end
end