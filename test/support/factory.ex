defmodule Community.Factory do
  use ExMachina.Ecto, repo: Community.Repo

  use Community.Factories.PostFactory
  use Community.Factories.LinkFactory
end
