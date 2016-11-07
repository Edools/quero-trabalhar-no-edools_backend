class School < ActiveRecord::Base
	belongs_to :user
	has_many :courses

	def self.search(search)
		if search
			where('lower(name) like ?', "%#{search.downcase}%")
		else
			scoped
		end
	end


end
