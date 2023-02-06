require 'bundler'
Bundler.require

get '/hello' do
  '<h1>Hello coucou ! </h1>'
end