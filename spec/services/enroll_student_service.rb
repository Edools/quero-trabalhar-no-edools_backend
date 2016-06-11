require 'rails_helper'
RSpec.describe EnrollStudentService do
  let(:service) {EnrollStudentService.new}

  describe '#enroll' do
    let(:course) {FactoryGirl.create(:course)}
    let(:student) {FactoryGirl.create(:student)}

    it 'append student to course' do
      service.enroll(student, course)
      expect(student.courses).to include(course)
    end

    it 'Return enrollment' do
      expect(service.enroll(student, course)).to be_an_instance_of(Enrollment)
    end
  end

  describe '#unenroll' do
    let(:course) {FactoryGirl.create(:course)}
    let(:student) {FactoryGirl.create(:student)}

    before do
      student.courses << course
    end

    it 'remove student to course' do
      service.unenroll(student, course)
      expect(student.courses(true)).to_not include(course)
    end
  end
end