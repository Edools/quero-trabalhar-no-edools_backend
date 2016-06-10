require 'rails_helper'

RSpec.describe Student, type: :model do
  it{is_expected.to validate_presence_of(:name)}
  it{is_expected.to validate_presence_of(:enrollment)}
  it{is_expected.to validate_presence_of(:status)}
  it{is_expected.to define_enum_for(:status)}
  it{is_expected.to have_many(:courses).through(:course_students)}
end
