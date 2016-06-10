require 'rails_helper'

RSpec.describe CourseStudent, type: :model do
  it{is_expected.to belong_to(:course)}
  it{is_expected.to belong_to(:student)}
end
