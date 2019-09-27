class Course < ApplicationRecord

  belongs_to :school

  validates_presence_of :school, :title, :duration, :duration_unit, :price

  enum duration_unit: [ :hours, :days, :months ]

  scope :by_title, ->(title) { where('title like ?', "%#{title}%") }
  scope :by_school_name, ->(name) { joins(:school).where('schools.name LIKE ?', "%#{name}%") }
  before_destroy :can_be_destroyed?

  private

  def can_be_destroyed?
    if active_students.positive?
      errors.add(:base, 'Existem alunos ativos')
      throw :abort
    end
  end
end
