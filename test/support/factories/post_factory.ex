defmodule Community.Factories.PostFactory do
  defmacro __using__(_opts) do
    quote do
      def post_factory do
        %Community.News.Post{content: Faker.Lorem.sentence}
      end
    end
  end
end
