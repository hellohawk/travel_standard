class Country < ActiveRecord::Base
  belongs_to :subconti
  has_many :cities
end
