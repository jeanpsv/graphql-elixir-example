defmodule CommunityWeb.Schema do
  use Absinthe.Schema

  import_types CommunityWeb.Schema.News.LinkTypes
  import_types CommunityWeb.Schema.News.PostTypes

  query do
    import_fields :link_queries
    import_fields :post_queries
  end

  mutation do
    import_fields :link_mutations
  end
end
