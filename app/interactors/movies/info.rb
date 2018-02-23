module Movies
  class Info
    include Interactor

    URL = "https://www.kinopoisk.ru/film/".freeze

    delegate :film, to: :context

    def call
      context.result = formation_of_the_response
    end

    private

    def formation_of_the_response
      film_name + "\n" + original_name + "\n" + table_info
    end


    def film_name
      decorate_info document.css("#headerFilm h1")
    end

    def original_name
      decorate_info document.css("#headerFilm span")
    end


    def table_info
      info = ""

      document.css("#infoTable").css("tr").each do |tr|
        info += decorate_info(tr.css("td").first) + " "  + decorate_info(tr.css("td").last) + "\n"
      end

      info
    end

    def decorate_info(info)
      info.text.capitalize.squish
    end

    def url
      URL + film
    end

    def document
      @doc ||= Nokogiri::HTML(open(url))
    end
  end
end
