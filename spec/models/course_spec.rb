require 'rails_helper'

describe Course do
  it { is_expected.to belong_to :school }
end
