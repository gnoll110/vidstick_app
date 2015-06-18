class Medium < ActiveRecord::Base
  validates :filename, presence: true, length: { minimum: 2 }
end
