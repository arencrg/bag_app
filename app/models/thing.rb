class Thing
  include Mongoid::Document
  field :name, type: String

  embedded_in :bag
  validates_presence_of :name
end
