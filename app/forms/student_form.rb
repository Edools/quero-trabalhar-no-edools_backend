class StudentForm
  include ActiveModel::Model
  include Virtus.model

  attr_reader :school

  attribute :id, Integer
  attribute :name, String
  attribute :register_number, String
  attribute :status,Integer

  validates :name, :register_number, presence: true

  def initialize(attr = {}, user = nil, student = nil)
    @user = user
    if attr['id'].present?
      @student = student
      super(attr['student'])
    else
      super(attr)
    end
  end

  def persisted?
    @student.nil? ? false : @student.persisted?
  end

  def save
    if valid?
      create_student
    end
  rescue ActiveRecord::RecordNotUnique
    errors.add(:subdomain, 'ja foi criado.')
  end

  def update
    if valid?
      update_student
    end
  end

  private

  def create_student
    Student.create(name: name, register_number: register_number, status: status, user: @user)
  end

  def update_student
    @student.update(name: name, register_number: register_number, status: status)
  end

end
