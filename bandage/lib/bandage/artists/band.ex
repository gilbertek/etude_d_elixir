defmodule Bandage.Artists.Band do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bandage.Artists.Band
  alias Bandage.Artists.Album


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "bands" do
    field :description, :string
    field :name, :string
    field :genre, :string

    has_many :albums, Album

    timestamps()
  end

  @doc false
  def changeset(%Band{} = band, attrs) do
    band
    |> cast(attrs, [:name, :genre, :description])
    |> validate_required([:name, :genre])
  end
end
