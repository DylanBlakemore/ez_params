defmodule EzParamsTest do
  use ExUnit.Case
  doctest EzParams

  alias EzParams.Support.Parameterized

  test "sum/2" do
    assert Parameterized.sum(1, 2) == 3
  end

  test "params/0" do
    assert Parameterized.params() == [%{name: :a, options: [default: 1], type: :number}]
  end

  test "other_params/0" do
    assert Parameterized.other_params() == [
             %{name: :c, options: [default: 3], type: :number},
             %{name: :b, options: [default: 2], type: [:integer, :float]}
           ]
  end
end
