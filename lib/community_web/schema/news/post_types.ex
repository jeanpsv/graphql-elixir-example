defmodule CommunityWeb.Schema.News.PostTypes do
  use Absinthe.Schema.Notation

  alias CommunityWeb.Resolvers

  object :post do
    field :id, non_null(:id)
    field :content, non_null(:string)
  end
end
