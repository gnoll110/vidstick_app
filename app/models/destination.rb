class Destination < ActiveRecord::Base
  has_many :relations

  validates :path, presence: true, uniqueness: true, length: { minimum: 2 }
end
