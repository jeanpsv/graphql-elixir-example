defmodule CommunityWeb.Schema.News.PostTypes do
  use Absinthe.Schema.Notation

  alias CommunityWeb.Resolvers

  object :post do
    field :id, non_null(:id)
    field :content, non_null(:string)
  end

  object :post_queries do
    field :all_posts, non_null(list_of(non_null(:post))) do
      resolve &Resolvers.News.all_posts/3
    end
  end
end
