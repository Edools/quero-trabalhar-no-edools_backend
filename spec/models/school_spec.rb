require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'attributes' do
    context '#name' do
      it { expect(create(:school).name).not_to be_nil }
      it { expect(create(:school).name).to be_a String }
    end
    context '#courses' do 
      it { expect(create(:school).courses).not_to be_nil }
    end
    context '#owner_email' do
      it { expect(create(:school).owner_email).not_to be_nil }
      it { expect(create(:school).owner_email).to be_a String }
    end
    context '#pitch' do
      it { expect(create(:school).pitch).not_to be_nil }
      it { expect(create(:school).pitch).to be_a String }
    end
    context '#subdomain' do
      it { expect(create(:school).subdomain).not_to be_nil }
      it { expect(create(:school).subdomain).to be_a String }
      it 'conform to *.edools.com' do
        expect(create(:school).subdomain).to match(/[\w-]+.edools.com/)
        expect{create(:school, subdomain: 'test.fake.com')}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
    context '#created_at' do
      it { expect(create(:school).created_at).not_to be_nil }
    end
  end

  context '#active_students' do 
    before :each do
      @school = create(:school)

      create(:course, school_id: @school.id, active_students: 10)
      create(:course, school_id: @school.id, active_students: 20)
      create(:course, school_id: @school.id, active_students: 30)
    end

    it { expect(create(:school).active_students).to eq(0) } 
    it { expect(@school.active_students).to eq(60) }
  end
end
