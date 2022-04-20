require_relative './app/app'

def main
  app = App.new

  puts 'Welcome to School Library App!'

  app.populate_app

  loop do
    app.list_options
    option = app.select_option
    app.run_option(option)
  end
end

main
