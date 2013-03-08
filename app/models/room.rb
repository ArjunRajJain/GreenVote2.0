class Room < ActiveRecord::Base
  attr_accessible :name, :temp, :building_id
  belongs_to :building
  has_many :votes
  def self.import(file,bldng)
		spreadsheet = open_spreadsheet(file)
		header = spreadsheet.row(1)
		(2..spreadsheet.last_row).each do |i|
    		row = Hash[[header, spreadsheet.row(i)].transpose]
    		room = find_by_id(row["id"]) || new
    		room.attributes = row.to_hash.slice(*accessible_attributes)
	    	room.building_id = bldng
	    	room.save!
	  	end
  end
	def self.open_spreadsheet(file)
		case File.extname(file.original_filename)
		when ".csv" then Csv.new(file.path, nil, :ignore)
		when ".xls" then Excel.new(file.path, nil, :ignore)
		when ".xlsx" then Excelx.new(file.path, nil, :ignore)
		else raise "Unknown file type: #{file.original_filename}"
		end
	end
end
