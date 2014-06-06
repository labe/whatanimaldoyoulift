class Animal < ActiveRecord::Base
  validates_presence_of   :name, :min_weight_in_lbs, :max_weight_in_lbs, :slug
  validates_uniqueness_of :name

  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end
end
