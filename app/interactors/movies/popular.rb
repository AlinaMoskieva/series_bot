module Movies
  class Popular
    include Interactor

    URL = "https://www.kinopoisk.ru/afisha/new/city/430/".freeze

    def call
      context.list = movies_list
    end

    private

    def movies_list
      list = "Самые популярные фильмы: \n\n"

      document.css(".grph").first.parent.css("b").each_with_index do |item, index|
        list += "#{index + 1}. " + item.text + "\n"
      end
      list
    end

    def document
      @doc ||= Nokogiri::HTML(open(URL))
    end
  end
end
