class Source < ActiveRecord::Base
  validates :path, presence: true, length: { minimum: 2 }
end
