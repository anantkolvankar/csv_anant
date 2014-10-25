class Student < ActiveRecord::Base
	class << self
		def import(path)
			begin
				i=0
			  CSV.foreach(path, headers: true,:col_sep => "\t") do |row|
			  	student = find_by_roll_no(row["roll_no"]) || new
			    student.attributes = row.to_hash
		    	student.save!
			    i += 1
			    #Student.create! row.to_hash
			  end
			  # Send mail about success of import
			  Notifier.import_status(path,i).deliver
			rescue
				# Unable to import csv
				Notifier.import_error(path,"Invalid file format").deliver
			end
		end
	#Used to Send import task in BackGround using delayed_job
		handle_asynchronously :import
	end

	def self.from_csv(file)
		name = "#{Rails.root}/public/uploads/csv/csv-#{DateTime.now.to_i}.csv"
		File.open name, 'wb' do |f|
			f.write file.read
		end
		self.import(name)
	end

end
