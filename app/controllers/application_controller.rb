
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  post '/articles' do
    a = Article.create(title: params[:title], content: params[:content])

    redirect "/articles/#{a.id}"
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    Article.find(params[:id]).update(title: params[:title], content: params[:content])
    redirect "/articles/#{params[:id]}"
  end

  delete '/articles/:id' do
    Article.find(params[:id]).destroy
    redirect "/articles"
  end
end
