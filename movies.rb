@movies = [
  {name: "Jaws", rating: "PG", genre: "thriller"},
  {name: "Halloween", rating: "R", genre: "horror"}
]


# @movies.each do |movie|
#   puts movie[:name]
# end
def menu
  puts "What would you like to do?"
  puts "1). Create a movie"
  puts "2). View all movies"
  puts "3). Update a movie"
  puts "4). Delete a movie"
  puts "5). exit"
end

def add_movie
  @movie = {name: "", rating: "", genre: ""}
  puts "What is the name of your movie?"
  @movie[:name] = gets.strip
  # @movie[:name] = name
  puts "What is the rating of the movie?"
  @movie[:rating] = gets.strip
  puts "What is the genre?"
  @movie[:genre] = gets.strip

  # @movies << @movie
  @movies.push(@movie) 
end

def view_movies
  # #{} <- allows you to use a variable within a string
  @movies.each_with_index do |movie,index|
    puts "#{index + 1}). #{movie[:name]} - #{movie[:rating]}"
    puts movie[:genre]
    puts
  end
end

def update_movie(index)
  puts "What is the new name?"
  @movies[index][:name] = gets.strip
  puts "What is the new rating?"
  @movies[index][:rating] = gets.strip
  puts "What is the new genre?"
  @movies[index][:genre] = gets.strip
end

def delete_movie(index)
  # .delete_at(index)
  @movies.delete_at(index)
  puts "Movie deleted"
  view_movies
end

def app
  menu
  @option = gets.strip.to_i

  # if @option == 1
  #   #do something
  # elsif @option == 2

  case @option
  when 1
    add_movie
    app
  when 2
    view_movies
    app
  when 3
    puts "What movie do you want to update?"
    view_movies
    index = gets.strip.to_i
    update_movie(index - 1)
    app
  when 4
    puts "What movie do you want to delete?"
    view_movies
    index = gets.strip.to_i
    delete_movie(index - 1)
    app
  when 5
    exit
  else
    puts "Please enter one of the number options"
    app
  end


end
app

