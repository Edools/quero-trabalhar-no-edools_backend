class SchoolRepository
  def self.get_all(order_by = 'name', way = 'asc', columns = nil)
    if columns
      School.select(columns).order("#{order_by} #{way}")
    else
      School.order("#{order_by} #{way}")
    end
  end

  def self.get_one(_id)
    school = find_school(_id)
    school if school
  end

  def self.create(_attrs)
    school = School.new(_attrs)
    school if school.save
  end

  def self.update(_id, _attrs)
    school = find_school(_id)
    school if school.update(_attrs)
  end

  def self.destroy(_id)
    School.destroy(_id)
  end

  def self.search(s)
    School.where('unaccent(name) ILIKE ?', "%#{I18n.transliterate(s.downcase)}%")
  end

  def self.get_active_students(_id)
    School.find(_id).courses.sum('courses.active_students')
  end

  private

  def self.find_school(_id)
    School.find(_id)
  end
end
