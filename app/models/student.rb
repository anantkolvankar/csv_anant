class Student < ActiveRecord::Base
	def self.import(file)
	  CSV.foreach(file.path, headers: true,:col_sep => "\t") do |row|
	  	student = find_by_roll_no(row["roll_no"]) || new
	    student.attributes = row.to_hash
    	student.save!
	    #Student.create! row.to_hash
	  end
	end
end
