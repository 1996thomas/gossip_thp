require 'sinatra'
require 'pry'
require_relative 'gossip'
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {all_gossips: Gossip.all}
  end
  get '/gossips' do
    erb :new_gossip
  end    
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
    end
  get '/gossips/:id' do 
    erb :show, locals: {show_gossips: Gossip.find(params['id'].to_i)}
  end

  get '/gossips/:id/edit' do
    erb :edit, locals: {show_gossips: Gossip.find(params['id'].to_i)}
  end

  post '/gossips/:id/edit' do
    self.new_edit(params['id'],params["new_gossip_author"],params["new_gossip_content"])
    end
end
