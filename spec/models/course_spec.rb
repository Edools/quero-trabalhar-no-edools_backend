require 'rails_helper'

describe Course do
  it { is_expected.to belong_to :school }
  it { is_expected.to have_and_belong_to_many :students }
end
