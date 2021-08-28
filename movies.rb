require_relative 'wallet.rb'
# require_relative 'file.rb'

@movies = [
  {name: "Jaws", rating: "PG", genre: "thriller", ticket_price: 10.50},
  {name: "Halloween", rating: "R", genre: "horror", ticket_price: 10.50},
  {name: "Raiders of the Lost Ark", rating: "PG", genre: "action", ticket_price: 10.50},
  {name: "Monty Python and the Holy Grail", rating: "PG", genre: "comedy", ticket_price: 10.50},
  {name: "E.T. the Extra-Terrestrial", rating: "PG", genre: "adventure", ticket_price: 10.50}
]



# @movies.each do |movie|
#   puts movie[:name]
# end

def menu
  puts "Welcome to the movie theater!"
  puts "How much to you have to spend?"
  money = gets.strip.to_f
  @wallet = Wallet.new(money)
  if @wallet.validate_money(money)
    puts "Your current balance is: $#{@wallet.current_balance}"
    puts
    puts "What movie would you like to see?"
    view_movies
  else
    puts "invalid amount. try again"
    menu
  end
end

def view_movies
  # #{} <- allows you to use a variable within a string
  @movies.each_with_index do |movie,index|
    puts "#{index + 1}). #{movie[:name]} - #{movie[:rating]} - #{movie[:genre]}"
    puts "$#{movie[:ticket_price]}"
    puts
  end
end

def handle_movie_select(index)
  money = @wallet.current_balance - @movies[index][:ticket_price]
  if @wallet.validate_money(money)
    @wallet.subtract_money(@movies[index][:ticket_price])
    puts "Your new balance is: $#{@wallet.current_balance}"
    puts "Enjoy the movie!"
  else
    puts "sorry you cannot see this movie"
  end
end

def app
  menu
  @option = gets.strip.to_i

  case @option
  when 1
    handle_movie_select(@option - 1)
  when 2
    handle_movie_select(@option - 1)
  when 3
    handle_movie_select(@option - 1)
  when 4
    handle_movie_select(@option - 1)
  when 5
    handle_movie_select(@option - 1)
  else
    puts "Please enter one of the number options"
    app
  end


end
app

