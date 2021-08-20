@movies = [
    {name: "Jaws", rating: "PG", genre: "adventure"},
    {name: "Halloween", rating: "R", genre: "horror"}
]

def menu
  puts "What would you like to do?"
  puts "1). add a movie"
  puts "2). view all movies"
  puts "3). update a movie"
  puts "4). delete a movie"
  puts "5). exit"
end
def add_movie
  @movie = {name: "", rating: "", genre: ""}
  puts "What is the name of your movie?"
  @movie[:name] = gets.strip
  puts "what is the movie rating?"
  @movie[:rating] = gets.strip
  puts "what is the genre?"
  @movie[:genre] = gets.strip
  @movies << @movie

end
def view_movies
 @movies.each do |movie|
  puts "#{movie[:name]} #{movie[:rating]} #{movie[:genre]}"
 end
end
def update_movie(index)
  puts "what is the new name?"
  @movies[index - 1][:name] = gets.strip
  puts "what is the rating?"
  @movies[index - 1][:rating] = gets.strip
  puts "what is the new genre?"
  @movies[index - 1][:genre] = gets.strip
end
def delete_movie(index)
  @movies.delete_at(index - 1)
  puts "movie deleted. here's your new list"
  view_movies

end

def app
  
  menu
  @option = gets.strip.to_i
  case @option
  when 1
    add_movie
    app
  when 2
    view_movies
    app
  when 3
    puts "Which movie do you want to delete?"
    view_movies
    index = gets.strip.to_i
    update_movie(index)
    app
  when 4
    puts "what movie do we want to delete?"
    view_movies
    index = gets.strip.to_i
    delete_movie(index)
    app
  when 5
    exit
  else
    puts "Invalid option try again"
    app
  end
end

app


