def home_path
  "http://whatanimaldoyoulift.herokuapp.com"
end

def image_path(animal)
  "/images/#{animal.slug}.png"
end

def twitter_share_text(name)
  "I can pick up a #{name} and put it down with authority. What animal do you even lift?"
end

def urlify(text)
  text.gsub(" ", "%20")
end