class Medium < ActiveRecord::Base
  has_many :relations
  has_many :destinations, through: :relations

  accepts_nested_attributes_for :relations,
                                reject_if: :reject_relations,
                                allow_destroy: true
  def reject_relations(attributes)
    attributes['destination_id'].blank?
  end

  validates :filename, presence: true, uniqueness: true, length: { minimum: 2 }
end
