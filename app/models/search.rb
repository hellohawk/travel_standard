class Search < ActiveRecord::Base
  belongs_to :uplaod

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      obj = find_by(id: row["id"]) || new
      obj.attributes = row.to_hash.slice(*updatable_attributes)

      obj.save!
    end
  end

  def self.updatable_attributes
    ["country_name","subconti_name","conti_name","city_name","country","subcontinent","continent","city"]
  end

end
