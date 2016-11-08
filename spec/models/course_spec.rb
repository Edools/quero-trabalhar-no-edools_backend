require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'attributes' do
    context '#title' do
      it { expect(create(:course).title).not_to be_nil }
      it { expect(create(:course).title).to be_a String }
    end
    context '#school' do
      it { expect(create(:course).school).not_to be_nil }
      it { expect(create(:course).school).to be_a School }
    end
    context '#description' do
      it { expect(create(:course).description).not_to be_nil }
      it { expect(create(:course).description).to be_a String }
    end
    context '#content' do
      it { expect(create(:course).content).not_to be_nil }
      it { expect(create(:course).content).to be_a String }
    end
    context '#duration' do
      it { expect(create(:course).duration).not_to be_nil }
      it { expect(create(:course).duration).to be_a String }
    end
    context '#created_at' do
      it { expect(create(:course).created_at).not_to be_nil }
    end
    context '#active_students' do
      it { expect(create(:course).active_students).not_to be_nil }
      it { expect(create(:course).active_students).to be_a Integer }
    end
    context '#price' do
      it { expect(create(:course).price).not_to be_nil }
      it { expect(create(:course).price).to be_a Float }
    end
  end
end
