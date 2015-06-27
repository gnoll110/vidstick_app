class Destination < ActiveRecord::Base
  has_many :relations
  has_many :media, :through => :relations

  validates :path, presence: true, uniqueness: true, length: { minimum: 2 }
end
