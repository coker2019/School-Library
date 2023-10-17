require './app'
require './main_menu'

def main
  app = App.new
  puts 'Welcome to School Library System!'
  loop do
    main_menu
    selected = gets.chomp.to_i
    break if selected == 7

    select_option(selected, app)
  end
  puts 'Thank you for using this app!'
end

main
