defmodule OtpBankTest do
  use ExUnit.Case
  doctest Solutions

  test "new/1" do
    assert Kernel.is_pid(OtpBank.new)
  end

  test "balance/1" do
    act = OtpBank.new(20)
    assert OtpBank.balance(act) == 20
  end

  test "deposit/2" do
    act = OtpBank.new(20)
    OtpBank.deposit(act, 40)
    assert OtpBank.balance(act) == 60
  end

  test "withdraw/2" do
    act = OtpBank.new(20)
    OtpBank.withdraw(act, 2)
    assert OtpBank.balance(act) == 18
  end
end
