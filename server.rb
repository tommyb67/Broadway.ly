#require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_record'
require 'pry'
#require_relative 'config/environments'
require_relative 'models/song'
require_relative 'models/show'

ActiveRecord::Base.establish_connection(
:adapter => 'postgresql',
:host => 'localhost',
:username => 'thomasbrennan',
:password => '',
:database => 'broadway_db'
)

#binding.pry

after do
  ActiveRecord::Base.clear_active_connections!
end



# after do
#   ActiveRecord::Base.clear_active_connections!
# end


# Welcome to Broadway.ly!

get "/" do
  erb :index
end

# Index of all shows
# with links to individual shows

get "/shows" do
  @shows = Show.all
  erb :"shows/index"
end

# Form to create new show

get "/shows/new" do
  erb :"shows/new"
end

# Create action - new show - redirects to that
# show

post "/shows" do
  show = Show.new(params[:show])
  show.save
  redirect '/shows'
end

# Individual show page
# Links to list of all songs `/shows/:id/songs`
# and form to create new songs `/shows/:id/songs/new`

get "/shows/:show_id" do
  @show = Show.find(params[:show_id])
  erb :"shows/show"
end

#binding.pry

# Form to create new songs

get "/shows/:id/songs/new" do
end

# Create action - new songs for a show - redirects
# to that song

post "/shows/:id/songs" do
end

# Lists all songs from the show

get "/shows/:id/songs" do
end

# Shows just one song from the show

get "/shows/:show_id/songs/:song_id" do
end