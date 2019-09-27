require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let!(:school) { create(:school) }
  let!(:course) { create(:course, school_id: school.id) }
  let!(:student) { create(:student, course_id: course.id) }

  describe 'GET new' do
    context 'Success' do
      before :each do
        get :new,  params: {  course_id: course.id }, xhr: true, format: 'js'
      end

      it 'returns status 200' do
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'POST create' do
    context 'Success' do
      before :each do
        post :create,
              params: {course_id: course.id, student: attributes_for(:student).merge(course_id: course.id)},
             xhr: true, format: 'js'
      end

      it 'returns 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'returns created object' do
        expect(assigns[:student].id).not_to be_nil
      end
    end

    context 'Failure' do
      before :each do
        post :create,
            params: {course_id: course.id, student: { name: '' }.merge(course_id: course.id) },
            xhr: true, format: 'js'
      end

      it 'returns created object' do
        expect(assigns[:student].id).to be_nil
      end
    end
  end

  describe 'GET activate' do
    context 'Success' do
      before :each do
        get :activate,
              params: {course_id: course.id, id: student.id},
              xhr: true, format: 'js'
      end

      it 'returns 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'returns created object' do
        expect(assigns[:student].active).to be_truthy
      end
    end
  end

  describe 'GET deactivate' do
    context 'Success' do
      before :each do
        get :deactivate,
              params: {course_id: course.id, id: student.id},
              xhr: true, format: 'js'
      end

      it 'returns 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'returns created object' do
        expect(assigns[:student].active).to be_falsey
      end
    end
  end
end
