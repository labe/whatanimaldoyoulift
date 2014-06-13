get '/' do
  return status 500 if request.xhr?

  begin
    @use_metric = request.location ? (request.location.country_code != "US") : false
  rescue => e
    logger.error "Problem with geocoder, possibly freegeoip.net is down"
  end

  erb :index
end

post '/' do
  units =  params[:units]
  weight = units == "lbs" ? params[:weight].to_f : (params[:weight].to_f * 2.2)
  animal = Animal.where("min_weight_in_lbs < ? AND max_weight_in_lbs >= ?", weight, weight).sample

  redirect to "/#{animal.name.parameterize}"
end

get '/:animal_slug' do
  @animal =      Animal.find_by_slug(params[:animal_slug])
  @next_animal = Animal.find_by_min_weight_in_lbs(@animal.max_weight_in_lbs) if @animal && @animal.max_weight_in_lbs != 1

  if !@animal
    redirect to "/"
  else
    erb :result, layout: (request.xhr? ? false : true)
  end
end
