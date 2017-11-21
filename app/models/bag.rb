class Bag
  include Mongoid::Document
  field :name, type: String
  field :description, type: String

  embeds_many :things
  validates_presence_of :name, :description
end


