class Medium < ActiveRecord::Base
  has_many :relations
  has_many :destinations, :through => :relations

  accepts_nested_attributes_for :relations,
                                reject_if: proc { |attributes| attributes['destination_id'].blank? },
                                allow_destroy: true

  validates :filename, presence: true, uniqueness: true, length: { minimum: 2 }
  #validates :modified_filemale, uniqueness: true, length: { minimum: 2 }
end
