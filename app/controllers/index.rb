require 'sinatra'

get '/' do

"Max"

end

get '/sealions' do
  @sealion = SeaLion.all
  erb :index
end

get '/sealions/new' do
  erb :'sealions/new'
end

get '/sealions/:id' do
  @id_sealion = SeaLion.find(params[:id])

  if @id_sealion
    erb :'show'
  else
    [404, 'No Flipper Found']
  end
end

post '/sealions' do
sealion = SeaLion.create(params)
redirect '/sealions'

end

put '/sealions/:id' do
sealion = SeaLion.find(params[:id])
sealion.update_attribute(params)
redirect '/sealions'
end

delete '/sealions/:id' do
  sealion =SeaLion.find(params[:id])
  sealion.destroy
  redirect '/sealions'
end