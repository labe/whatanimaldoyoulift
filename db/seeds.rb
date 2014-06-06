#0 - 100
LOW = [
  ["Roberto's California Burrito", 1, 1],
  ["Platypus", 2, 5],
  ["European Hare", 5, 10],
  ["Red Fox", 10, 15],
  ["River Otter", 15, 20],
  ["Wolverine", 20, 25],
  ["Stately Iberian Lynx", 25, 30],
  ["Baby Sea Lion", 30, 35],
  ["Moose Calf", 35, 40],
  ["Clouded Leopard", 40, 45],
  ["Young Alpine Ibex", 45, 50],
  ["Female Emperor Penguin", 50, 55],
  ["Giant Armadillo", 55, 60],
  ["Mature Wombat", 60, 65],
  ["Newborn Manatee", 65, 70],
  ["Small Mountain Goat", 70, 75],
  ["Baby Zebra", 75, 80],
  ["Newborn Texas Longhorn", 80, 85],
  ["Spotted Serengeti Hyena", 85, 90],
  ["Medium Warthog", 90, 95],
  ["Cheetah", 95, 100]
]

#100 - 200
MEDIUM = [
  ["Grey Wolf", 100, 110],
  ["Young Male Puma", 110, 120],
  ["Desert Bighorn Ewe", 120, 130],
  ["Baby Giraffe", 130, 140],
  ["Komodo Dragon", 140, 150],
  ["Medium-Sized Deer", 150, 160],
  ["Mature Alpaca", 160, 170],
  ["Male Red Kangaroo", 170, 180],
  ["Black Bear", 180, 190],
  ["Baby Elephant", 190, 200]
]

#200 - 400
HIGH = [
  ["Fledgling Hippo", 200, 220],
  ["Male Giant Panda", 220, 240],
  ["Svelte Wildebeest", 240, 260],
  ["Fledgling Pacific Walrus", 260, 280],
  ["Loggerhead Sea Turtle", 280, 300],
  ["Sloth Bear", 300, 320],
  ["Mature Harbor Seal", 320, 340],
  ["Newborn Orca Whale", 340, 360],
  ["Black Jaguar", 360, 380],
  ["Juvenile Crocodile", 380, 400]
]

# 400 - 1000
WHOA = [
  ["West Indian Manatee", 400, 500],
  ["Mature Bluefin Tuna", 500, 600],
  ["Polar Bear", 500, 700],
  ["American Elk", 600, 700],
  ["Superior Eastern Highland Gorilla", 600, 800],
  ["Galapagos Tortoise", 800, 900],
  ["Jersey Cow", 800, 1000],
  ["Musk Ox", 900, 1000],
  ["Hammerhead Shark", 900, 1000]
]

# # 1000 +
# WHAT = [
#   ["Mature Male Moose", 1_000, 1_500],
#   ["Clydesdale", 1_500, 2_000],
#   ["Giraffe", 1_800, 3_520],
#   ["Water Buffalo", 2_000, 3_000],
#   ["Black Rhinoceros", 3_000, 4_500],
#   ["White Rhinoceros", 4_000, 6_000],
#   ["Newborn Blue Whale", 6_000, 8_000],
#   ["African Elephant", 8_000, 15_000],
#   ["Whale Shark", 40_000, 75_000],
#   ["Mature Blue Whale", 220_000, 352_000]
# ]

[LOW, MEDIUM, HIGH, WHOA].each do |weight_class|
  weight_class.each do |name, min_lbs, max_lbs|
    Animal.create(name: name, min_weight_in_lbs: min_lbs, max_weight_in_lbs: max_lbs)
  end
end