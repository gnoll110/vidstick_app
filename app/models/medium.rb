class Medium < ActiveRecord::Base
  validates :filename, presence: true, uniqueness: true, length: { minimum: 2 }
  #validates :modified_filemale, uniqueness: true, length: { minimum: 2 }
end
