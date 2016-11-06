require 'rails_helper'

RSpec.describe Course do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:amount) }

  it { is_expected.to belong_to(:school) }
end
