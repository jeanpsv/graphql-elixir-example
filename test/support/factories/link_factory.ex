defmodule Community.Factories.LinkFactory do
  defmacro __using__(_opts) do
    quote do
      def link_factory do
        %Community.News.Link{
          url: Faker.Internet.url,
          description: Faker.Lorem.sentence,
          post: build(:post)
        }
      end
    end
  end
end
