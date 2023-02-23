defmodule CalculatorOtpCoreTest do
  use ExUnit.Case
  import CalculatorOtp.Core

  test "subtracts" do
    assert subtract(2, 4) == -2
  end

  test "adds" do
    assert add(1, 1) == 2
  end

  test "multiplies" do
    assert multiply(2, -2) == -4
  end

  test "divides" do
    assert divide(9, 3) == 3
  end

  test "folds" do
    assert fold([2, 3, 4, 5], 0, &add/2) == 15
  end
end
