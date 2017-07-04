defmodule Wallet do
  @moduledoc """
  Documentation for Wallet.
  """

  @doc """
  """
  alias Wallet.WalletServer

  def deposit(wallet, amount) do
    WalletServer.deposit(wallet, amount)
  end

  def withdraw(wallet, amount) do
    WalletServer.withdraw(wallet, amount)
  end

  def balance(wallet) do
    WalletServer.balance(wallet)
  end
end
