defmodule Community.News.Link do
  use Ecto.Schema
  import Ecto.Changeset
  alias Community.News.{Link, Post}


  schema "links" do
    field :description, :string
    field :url, :string

    belongs_to :post, Post, on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(%Link{} = link, attrs) do
    link
    |> cast(attrs, [:url, :description, :post_id])
    |> validate_required([:url, :description, :post_id])
  end
end
