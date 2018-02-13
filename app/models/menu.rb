class Menu
  MENU_TITLE = "*Основные возможности бота:*\n\n➰ Добавление сериал в список тех, которые вы смотрите
  `/add_serial название сериала`.\n\n➰ Удаление сериала из списка, используя команду\n `/remove_serial название сериала`".freeze
  MENU_ITEMS = [
    [{ text: "Мои сериалы", callback_data: "my" }],
    [{ text: "Фильмы в кино", callback_data: "movies" }],
    [{ text: "Самые популярные фильмы за эту неделю", callback_data: "most" }],
  ].freeze

  METHODS_TO_CALL = { my: "my_serials", add: "add_serial", remove: "remove_serial", movies: "movies",
                      most: "most_popular" }.freeze
end
