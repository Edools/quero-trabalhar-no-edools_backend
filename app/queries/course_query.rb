class CourseQuery < BaseQuery
  def self.relation(base_relation=nil)
    super(base_relation, Course)
  end

  def page_index(page_param)
    paginate(:page => page_param)
  end

  def order_index
    order(updated_at: :desc)
  end

  def by_school(school)
    if school.present?
      where("school_id = ?", school)
    else
      where(nil)
    end
  end

  def by_title(title)
    if title.present?
      search_by_title(title)
    else
      where(nil)
    end
  end

end
