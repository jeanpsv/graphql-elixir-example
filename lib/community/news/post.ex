defmodule Community.News.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Community.News.Post


  schema "posts" do
    field :content, :string

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
