require 'sinatra'
require 'slim'

require_relative 'lib/post'

set :slim, pretty: true

get '/' do
  @posts = Post.all
  slim :'posts/index'
end

get '/posts/:slug' do
  @post = Post.find(:slug, params[:slug])
  slim :'posts/show'
end

