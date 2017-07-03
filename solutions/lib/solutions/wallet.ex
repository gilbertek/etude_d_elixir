defmodule Wallet do
  @moduledoc """
  Agent implementation of Wallet interface
  """

  def start_link(amount) do
    Agent.start_link(fn -> amount end)
  end

  def deposit(wallet, money) do
    Agent.update(wallet, fn(amount) -> amount + money end)
  end

  def withdraw(wallet, money) do
    Agent.update(wallet, fn(amount) -> amount - money end)
  end

  def amount(wallet) do
    Agent.get(wallet, fn(amount) -> amount end)
  end
end
