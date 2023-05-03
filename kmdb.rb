# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!
# generated using rails generate model and rails db:migrate on terminal and on respective files

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

warner = Studio.new
warner["name"] = "Warner Bros."
warner.save

batman_1 = Movie.new
batman_1["title"] = "Batman Begins"
batman_1["year_released"] = 2005
batman_1["rated"] = "PG-13"
batman_1["studio_id"] = warner ["id"]
batman_1.save

batman_2 = Movie.new
batman_2["title"] = "The Dark Knight"
batman_2["year_released"] = 2008
batman_2["rated"] = "PG-13"
batman_2["studio_id"] = warner ["id"]
batman_2.save

batman_3 = Movie.new
batman_3["title"] = "The Dark Knight Rises"
batman_3["year_released"] = 2012
batman_3["rated"] = "PG-13"
batman_3["studio_id"] = warner ["id"]
batman_3.save

actor_names = ["Christian Bale", "Michael Caine", "Liam Neeson", "Katie Holmes", "Gary Oldman", "Heath Ledger", "Aaron Eckhart", "Maggie Gyllenhaal", "Tom Hardy", "Joseph Gordon-Levitt", "Anne Hathaway"]

for name in actor_names
    actor = Actor.new
    actor["name"] = name
    actor.save
end

# Batman Begins 
bw = Role.new
bw["movie_id"] = batman_1["id"]
bw["actor_id"] = Actor.find_by({"name" => "Christian Bale"})["id"]
bw["character_name"] = "Bruce Wayne"
bw.save

alf = Role.new
alf["movie_id"] = batman_1["id"]
alf["actor_id"] = Actor.find_by({"name" => "Michael Caine"})["id"]
alf["character_name"] = "Alfred"
alf.save

rag = Role.new
rag["movie_id"] = batman_1["id"]
rag["actor_id"] = Actor.find_by({"name" => "Liam Neeson"})["id"]
rag["character_name"] = "Ra's Al Ghul"
rag.save

rach = Role.new
rach["movie_id"] = batman_1["id"]
rach["actor_id"] = Actor.find_by({"name" => "Katie Holmes"})["id"]
rach["character_name"] = "Rachel Dawes"
rach.save

gord = Role.new
gord["movie_id"] = batman_1["id"]
gord["actor_id"] = Actor.find_by({"name" => "Gary Oldman"})["id"]
gord["character_name"] = "Commissioner Gordon"
gord.save

# The Dark Knight
bw2 = Role.new
bw2["movie_id"] = batman_2["id"]
bw2["actor_id"] = Actor.find_by({"name" => "Christian Bale"})["id"]
bw2["character_name"] = "Bruce Wayne"
bw2.save

jok = Role.new
jok["movie_id"] = batman_2["id"]
jok["actor_id"] = Actor.find_by({"name" => "Heath Ledger"})["id"]
jok["character_name"] = "Joker"
jok.save

dnt = Role.new
dnt["movie_id"] = batman_2["id"]
dnt["actor_id"] = Actor.find_by({"name" => "Aaron Eckhart"})["id"]
dnt["character_name"] = "Harvey Dent"
dnt.save

alf2 = Role.new
alf2["movie_id"] = batman_2["id"]
alf2["actor_id"] = Actor.find_by({"name" => "Michael Caine"})["id"]
alf2["character_name"] = "Alfred"
alf2.save

rach2 = Role.new
rach2["movie_id"] = batman_2["id"]
rach2["actor_id"] = Actor.find_by({"name" => "Maggie Gyllenhaal"})["id"]
rach2["character_name"] = "Rachel Dawes"
rach2.save

#The Dark Knight Rises
bw3 = Role.new
bw3["movie_id"] = batman_3["id"]
bw3["actor_id"] = Actor.find_by({"name" => "Christian Bale"})["id"]
bw3["character_name"] = "Bruce Wayne"
bw3.save

gord2 = Role.new
gord2["movie_id"] = batman_3["id"]
gord2["actor_id"] = Actor.find_by({"name" => "Gary Oldman"})["id"]
gord2["character_name"] = "Commissioner Gordon"
gord2.save

bane = Role.new
bane["movie_id"] = batman_3["id"]
bane["actor_id"] = Actor.find_by({"name" => "Tom Hardy"})["id"]
bane["character_name"] = "Bane"
bane.save

jb = Role.new
jb["movie_id"] = batman_3["id"]
jb["actor_id"] = Actor.find_by({"name" => "Joseph Gordon-Levitt"})["id"]
jb["character_name"] = "John Blake"
jb.save

sk = Role.new
sk["movie_id"] = batman_3["id"]
sk["actor_id"] = Actor.find_by({"name" => "Anne Hathaway"})["id"]
sk["character_name"] = "Selina Kyle"
sk.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.

movies = Movie.all

for movie in movies
    title = movie["title"]
    year = movie["year_released"]
    rated = movie["rated"]
    studio = Studio.find_by({"id" => movie["studio_id"]})["name"]
    puts "#{title} #{year} #{rated} #{studio}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

cast_members = Role.all

for cast in cast_members
    movie_title = Movie.find_by({"id" => cast["movie_id"]})["title"]
    actor_name = Actor.find_by({"id" => cast["actor_id"]})["name"]
    character_name = cast["character_name"]
    puts "#{movie_title} #{actor_name} #{character_name}"
end

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
