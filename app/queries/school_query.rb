class SchoolQuery < BaseQuery
  def self.relation(base_relation=nil)
    super(base_relation, School)
  end

  def page_index(page_param)
    paginate(:page => page_param)
  end

  def order_index
    order(updated_at: :desc)
  end

  def by_name(name)
    if name.present?
      search_by_name(name)
    else
      where(nil)
    end
  end
end