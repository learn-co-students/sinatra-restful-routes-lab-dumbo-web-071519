require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  get '/recipes' do 
    @recipes = Recipe.all

    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @new_recipe = Recipe.create(params)
    
    redirect "/recipes/#{@new_recipe.id}"
  end

  get '/recipes/:id' do 
    find_recipe
    erb :show
  end

  get '/recipes/:id/edit' do 
    find_recipe

    erb :edit
  end

  patch '/recipes/:id' do 
    find_recipe
    @recipe.update(params[:recipe])

    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do 
    find_recipe
    @recipe.destroy()

    redirect "/recipes"
  end

end
