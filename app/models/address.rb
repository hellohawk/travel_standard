class Address < ActiveRecord::Base

    scope :autocomplete, ->(term) { where("name LIKE ?", "#{term}%").order(:name) }

end
