defmodule EzParams.Support.Parameterized do
  use EzParams

  param :a, :number, default: 1

  @spec params() :: list(map())
  def params do
    @__params__
  end

  param :b, :integer | :float, default: 2
  param :c, :number, default: 3

  @spec other_params() :: list(map())
  def other_params do
    @__params__
  end

  @spec sum(number(), number()) :: number()
  def sum(a, b) do
    a + b
  end
end
