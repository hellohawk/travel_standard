class Map < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      map = find_by(id: row["id"]) || new
      map.attributes = row.to_hash.slice(*updatable_attributes)
      map.save!
    end
  end

  def self.updatable_attributes
    ["id","resolutions","pre_resolutions","regions_name","regions"]
  end

  belongs_to :upload

end
