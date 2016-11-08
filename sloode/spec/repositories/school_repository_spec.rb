require 'rails_helper'

RSpec.describe SchoolRepository do
  describe '#get_all' do
    before(:each) do
      create(:school)
    end

    context 'without specifying columns' do
      it do
        schools = SchoolRepository.get_all
        expect(schools.count).to eq 1
      end
    end

    context 'specifying columns' do
      it do
        courses = SchoolRepository.get_all('name', 'asc', %w(id name))
        expect(courses[0].respond_to?('id')).to be true
        expect(courses[0].respond_to?('name')).to be true
        expect(courses[0].respond_to?('subdomain')).to be false
      end
    end
  end

  describe '#get_one' do
    it 'retrieves one school' do
      school = create(:school)
      found_school = SchoolRepository.get_one(school.id)

      expect(found_school.id).to eq school.id
    end
  end

  describe '#create' do
    context 'with valid params' do
      it 'creates a school' do
        expect do
          SchoolRepository.create(attributes_for(:school))
        end.to change(School, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'does not create a school' do
        expect do
          SchoolRepository.create(attributes_for(:school, name: nil))
        end.to change(School, :count).by(0)
      end
    end
  end

  describe '#update' do
    before do
      @school = create(:school, name: 'Edools')
    end

    context 'with valid params' do
      it 'updates a school' do
        updated_school = SchoolRepository.update(@school.id, name: 'Sloode')
        expect(School.find(@school.id).name).to eq 'Sloode'
      end
    end

    context 'with invalid params' do
      it 'does not update a school' do
        updated_school = SchoolRepository.update(@school.id, name: nil)
        expect(School.find(@school.id).name).to eq 'Edools'
      end
    end
  end

  describe '#destroy' do
    it 'removes a school' do
      school = create(:school)

      expect do
        SchoolRepository.destroy(school.id)
      end.to change(School, :count).by(-1)
    end
  end

  describe '#search_by_name' do
    it 'searches a school by name' do
      school1 = create(:school, name: 'Guanabara')
      school2 = create(:school, name: 'Macedo')

      found_schools = SchoolRepository.search('guana')

      expect(found_schools[0].name).to eq school1.name
      expect(found_schools[0].name).to_not eq school2.name
    end
  end

  describe '#get_active_students' do
    it "retrieves total of active students" do
      school = create(:school)
      create(:course, active_students: 5, school_id: school.id)

      expect(SchoolRepository.get_active_students(school.id)).to eq 5
    end
  end
end
