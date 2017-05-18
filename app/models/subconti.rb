class Subconti < ActiveRecord::Base
  belongs_to :conti
  has_many :counties
end
