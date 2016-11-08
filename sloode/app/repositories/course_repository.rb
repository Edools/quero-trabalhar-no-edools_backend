class CourseRepository
  def self.get_all_by_school(school_id, order_by = 'title', way = 'asc', columns = nil)
    if columns
      Course.select(columns).order("#{order_by} #{way}").where(school_id: school_id)
    else
      Course.order("#{order_by} #{way}").where(school_id: school_id)
    end
  end

  def self.get_one(_id)
    course = find_course(_id)
    course if course
  end

  def self.create(_attrs)
    course = Course.new(_attrs)
    course if course.save
  end

  def self.update(_id, _attrs)
    course = find_course(_id)
    course if course.update(_attrs)
  end

  def self.destroy(_id)
    Course.destroy(_id)
  end

  def self.search(s)
    Course.where('unaccent(title) ILIKE ?', "%#{I18n.transliterate(s).downcase}%")
  end

  private

  def self.find_course(_id)
    Course.find(_id)
  end
end
