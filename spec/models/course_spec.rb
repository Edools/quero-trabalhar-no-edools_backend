require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'validations' do
    context 'presence_of' do
      it { expect(subject).to validate_presence_of(:title) }
      it { expect(subject).to validate_presence_of(:description) }
      it { expect(subject).to validate_presence_of(:content) }
      it { expect(subject).to validate_presence_of(:duration) }
      it { expect(subject).to validate_presence_of(:active_students) }
      it { expect(subject).to validate_presence_of(:price) }
    end

    context 'numericality_of' do
      it { expect(subject).to validate_numericality_of(:price) }
      it { expect(subject).to validate_numericality_of(:active_students) }
    end
  end

  context 'relationships' do
    it { expect(subject).to belong_to(:school) }
  end
end
