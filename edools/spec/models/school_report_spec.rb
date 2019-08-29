require 'rails_helper'

describe SchoolReport do
  it { is_expected.to belong_to(:school) }
end
