class Relation < ActiveRecord::Base
  belongs_to :medium
  belongs_to :destination
end
