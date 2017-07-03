defmodule Wallet do
  @moduledoc """
  Documentation for Wallet.
  """

  @doc """
  """
  alias Wallet.WalletServer

  def deposit(wallet, money) do
    WalletServer.deposit(wallet, money)
  end

  def withdraw(wallet, money) do
    WalletServer.withdraw(wallet, money)
  end

  def amount(wallet) do
    WalletServer.amount(wallet)
  end
end
