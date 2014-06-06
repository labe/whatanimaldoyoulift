get '/' do
  erb :index
end

post '/' do
  units =  params[:units]
  weight = units == "lbs" ? params[:weight] : (params[:weight].to_f * 2.2)
  animal = Animal.where("min_weight_in_lbs < ? AND max_weight_in_lbs >= ?", weight, weight).sample
  
  redirect to "/#{animal.name.parameterize}"
end

get '/:animal_slug' do
  @animal =      Animal.find_by_slug(params[:animal_slug])
  @next_animal = Animal.find_by_min_weight_in_lbs(@animal.max_weight_in_lbs) if @animal && @animal.max_weight_in_lbs != 1

  if !@animal
    redirect to "/"
  elsif request.xhr?
    { name:             @animal.name,
      image_path:       image_path(@animal),
      next_animal_name: @next_animal.try(:name)
    }.to_json
  else
    erb :result
  end
end