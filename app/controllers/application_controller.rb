class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
# 4.  Again in the `application_controller.rb`, create a controller action that
#     uses RESTful routes to display a single recipe.
  # code actions here!
  
  #INDEX
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  #NEW
  get '/recipes/new' do
     erb :new
  end

  ##CREATE
  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

  #SHOW
  get '/recipes/:id' do
    find_recipe
    erb :show
  end

  #EDIT
  get '/recipes/:id/edit' do
    find_recipe
    erb :edit
  end

  #UPDATE
  patch '/recipes/:id' do
    find_recipe
    @recipe.update(params[:recipe])
    redirect "/recipes/#{@recipe.id}"
  end

  #DELETE
  delete '/recipes/:id' do
    find_recipe
    @recipe.destroy
    redirect "/recipes"
  end


  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
