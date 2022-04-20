require_relative 'requires'

class App
  include SaveData
  include GameModule
  include AuthorModule
  include BookModule
  include LabelModule
  include MusicAlbumModule
  include GenreModule
  include PopulateAuthors
  include PopulateGames
  include PopulateMusicAlbums
  include PopulateGenres
  include PopulateBooks
  include PopulateLabels

  attr_accessor :books, :music_albums, :movies, :games, :genres, :labels, :authors, :sources

  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
    @sources = []
    @options_list = Options.new.list
  end

  def populate_app
    @authors = populate_authors
    @genres = populate_genres
    @labels = populate_labels
    @books = populate_books
    @music_albums = populate_music_albums
    @movies = []
    @games = populate_games
    @sources = []
  end

  def list_options
    puts ''
    @options_list.each do |option|
      puts option[0]
    end
    puts 'Please select one of the options above by typing a number:
    '
  end

  def select_option
    gets.chomp.to_i
  end

  def run_option(option)
    if option.positive? && option <= @options_list.length - 1
      send(@options_list[option - 1][1])
    elsif option == @options_list.length
      puts 'Thank you, see you later!'
      exit
    else
      puts 'Please enter a valid option'
    end
  end
end
