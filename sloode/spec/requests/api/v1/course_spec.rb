require 'rails_helper'

RSpec.describe Rest::V1::CoursesController, type: :request do
  describe 'GET #index' do
    before do
      school = create(:school)
      create(:course, school_id: school.id)
      get "/rest/v1/schools/#{school.id}/courses"
    end

    it 'returns success' do
      expect(response).to be_success
    end

    it 'retrieves a list of schools' do
      expect(json['data'].length).to eq(1)
    end
  end

  describe 'GET #show' do
    let(:school) { create(:school) }
    let(:course) { create(:course, school_id: school.id) }

    before do
      get "/rest/v1/schools/#{school.id}/courses/#{course.id}"
    end

    it 'returns success' do
      expect(response).to be_success
    end

    it 'retrieves a course' do
      expect(json['data']['attributes']['id']).to eq(course.id)
      expect(json['data']['attributes']['title']).to eq(course.title)
      expect(json['data']['attributes']['school_id']).to eq(course.school_id)
      expect(json['data']['attributes']['description']).to eq(course.description)
      expect(json['data']['attributes']['content']).to eq(course.content)
      expect(json['data']['attributes']['duration']).to eq(course.duration)
      expect(json['data']['attributes']['active_students']).to eq(course.active_students)
      expect(json['data']['attributes']['price']).to eq(course.price.to_s)
    end
  end
end
