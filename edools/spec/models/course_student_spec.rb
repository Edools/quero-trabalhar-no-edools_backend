require 'rails_helper'

RSpec.describe CourseStudent, type: :model do
  it{is_expected.to validate_presence_of(:name)}
  it{is_expected.to belong_to(:course)}
  it{is_expected.to belong_to(:student)}
end
