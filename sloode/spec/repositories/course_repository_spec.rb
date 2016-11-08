require 'rails_helper'

RSpec.describe CourseRepository do
  let(:school) { create(:school) }

  describe '#get_all_by_school' do
    before do
      create_list(:course, 5, school_id: school.id)
    end

    context 'without specifying columns' do
      it do
        courses = CourseRepository.get_all_by_school(school.id)
        expect(courses.count).to eq 5
      end
    end

    context 'specifying columns' do
      it do
        courses = CourseRepository.get_all_by_school(school.id, 'title', 'asc', %w(id title))
        expect(courses[0].respond_to?('id')).to be true
        expect(courses[0].respond_to?('title')).to be true
        expect(courses[0].respond_to?('description')).to be false
      end
    end
  end

  describe '#get_one' do
    it 'retrieves one course' do
      course = create(:course, school_id: school.id)
      found_course = CourseRepository.get_one(course.id)

      expect(found_course.id).to eq course.id
    end
  end

  describe '#create' do
    context 'with valid params' do
      it 'creates a course' do
        expect do
          CourseRepository.create(attributes_for(:course, school_id: school.id))
        end.to change(Course, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'does not create a course' do
        expect do
          CourseRepository.create(attributes_for(:course, title: nil, school_id: school.id))
        end.to change(Course, :count).by(0)
      end
    end
  end

  describe '#update' do
    before do
      @course = create(:course, title: 'História', school_id: school.id)
    end

    context 'with valid params' do
      it 'updates a course' do
        updated_course = CourseRepository.update(@course.id, title: 'Matemática')
        expect(Course.find(@course.id).title).to eq 'Matemática'
      end
    end

    context 'with invalid params' do
      it 'does not update a course' do
        updated_course = CourseRepository.update(@course.id, title: nil)
        expect(Course.find(@course.id).title).to eq 'História'
      end
    end
  end

  describe '#destroy' do
    it 'removes a course' do
      course = create(:course, school_id: school.id)

      expect do
        CourseRepository.destroy(course.id)
      end.to change(Course, :count).by(-1)
    end
  end

  describe '#search_by_title' do
    it 'searches a course by title' do
      course1 = create(:course, title: 'Física',school_id: school.id)
      course2 = create(:course, title: 'Matemática', school_id: school.id)

      found_courses = CourseRepository.search('fis')

      expect(found_courses[0].title).to eq course1.title
      expect(found_courses[0].title).to_not eq course2.title
    end
  end
end
