module Movies
  class New
    include Interactor

    URL = "https://www.kinopoisk.ru/afisha/new/city/430/".freeze

    def call
      context.list = movies_list
    end

    private

    def movies_list
      list = "Сегодня в кино: \n\n"
      document.css(".filmsListNew").css(".item").each do |item|
        list += russian_name(item) + original_name_with_time(item) + info(item) + raiting(item) + genre(item) + "\n\n"
      end
      list
    end

    def russian_name(item)
      elem = item.css(".name").css("a")
      "*#{decorate(elem)}*"
    end

    def original_name_with_time(item)
      elem = item.css(".name").css("span")
      decorate(elem)
    end

    def info(item)
      elem = item.css(".gray").first
      decorate(elem)
    end

    def raiting(item)
      return unless item.css(".rating")
      elem = item.css(".rating")
      "Рейтинг #{decorate(elem)}"
    end

    def genre(item)
      item = item.css(".gray").last
      item.css("a").remove
      decorate(item)
    end

    def decorate(item)
      item.text.squish << "\n"
    end

    def document
      @doc ||= Nokogiri::HTML(open(URL))
    end
  end
end
