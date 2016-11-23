class CourseStudentForm
  include ActiveModel::Model
  include Virtus.model

  attr_reader :school

  attribute :id, Integer
  attribute :course_id, Integer
  attribute :student_id, Integer

  def initialize(attr = {}, course = nil)
    @course = course
    super(attr)
  end

  def save
    if valid?
      create_student
    end
  rescue ActiveRecord::RecordNotUnique
    errors.add(:subdomain, 'ja foi criado.')
  end

  private

  def subscribe_student
    @course.students.create(id: student_id)
  end
end
