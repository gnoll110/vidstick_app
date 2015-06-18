class Source < ActiveRecord::Base
  validates :path, presence: true, uniqueness: true, uniqueness: true, length: { minimum: 2 }
end
