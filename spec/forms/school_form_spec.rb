require 'rails_helper'

describe SchoolForm, type: :model do
  it { is_expected.to validate_presence_of(:name)  }
  it { is_expected.to validate_presence_of(:subdomain)  }
  it { is_expected.to (:subdomain)  }
end
