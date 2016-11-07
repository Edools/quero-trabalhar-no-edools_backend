class Course < ActiveRecord::Base
	belongs_to :school
	has_many :lessons

	has_many :course_subscriptions
	has_many :users, through: :course_subscriptions




	def self.search(search)
		if search
			where('lower(title) like ?', "%#{search.downcase}%")
		else
			scoped
		end
	end
end
