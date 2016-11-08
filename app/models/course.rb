class Course < ApplicationRecord
  belongs_to :school

  has_many :enrollments
  has_many :students, through: :enrollments

  validates :title, :school, :description, :content, :duration, :price, presence: true

  def self.periodicities
    ["Hours", "Days", "Weeks", "Months", "Years"]
  end

  def to_s
    "#{self.school.name} >> #{self.title}"
  end

  def self.search(params)

    # if receives both search and filter
    if (params[:search] and not params[:search].empty?) and (params[:filter] and not params[:filter].empty?)
      puts "asdssd"
      search_like = "%#{params[:search]}%"
      where("title ILIKE ? or description ILIKE ? or content ILIKE ?", search_like, search_like, search_like).where(school_id: params[:filter])
    elsif params[:search] and not params[:search].empty? # when receives only search
      search_like = "%#{params[:search]}%"
      where("title ILIKE ? or description ILIKE ? or content ILIKE ?", search_like, search_like, search_like)
    elsif params[:filter] and not params[:filter].empty? # when receives only filter
      where(school_id: params[:filter])
    else
      all
    end
  end
end
