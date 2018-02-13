module Movies
  class Popular
    include Interactor

    URL = "https://www.kinopoisk.ru/afisha/new/city/430/".freeze
    TITLE = "Самые популярные фильмы: \n\n".freeze

    def call
      context.list, context.buttons = movies_list
    end

    private

    def movies_list
      list, buttons = [TITLE, []]

      document.css(".grph").first.parent.css("b").each_with_index do |item, index|
        list += decorate_film_name(item.text, index)
        buttons << [{ text: item.text, callback_data: link(item) }]
      end

      [list, buttons]
    end

    def decorate_film_name(name, index)
      "#{index + 1}. " + name + "\n"
    end

    def link(item)
      item.css("a").first["href"]
    end

    def document
      @doc ||= Nokogiri::HTML(open(URL))
    end
  end
end
