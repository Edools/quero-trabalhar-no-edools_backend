class CourseForm
  include ActiveModel::Model
  include Virtus.model

  attr_reader :course

  attribute :id, Integer
  attribute :title, String
  attribute :description, String
  attribute :content, String
  attribute :duration, String
  attribute :price, Decimal

  def initialize(attr = {}, school = nil, course = nil)
    @school = school
    if attr['id'].present?
      @course = course
      puts @course.inspect
      super(attr['course'])
    else
      super(attr)
    end
  end

  def persisted?
    @course.nil? ? false : @course.persisted?
  end

  def save
    if valid?
      create_course
    end
  end

  def update
    if valid?
      update_course
    end
  end

  private

  def create_course
    puts @school.inspect
    Course.create(
      title: title,
      description: description,
      content: content,
      duration: duration,
      price: price,
      school: @school
    )
  end

  def update_course
    @course.update(
      title: title,
      description: description,
      content: content,
      duration: duration,
      price: price
    )
  end

end
