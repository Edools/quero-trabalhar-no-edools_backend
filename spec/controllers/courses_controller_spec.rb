require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let!(:school) { create(:school) }
  let!(:course) { create(:course, school_id: school.id) }

  describe 'GET #index' do
    before(:each) do
      get :index, xhr: true, format: 'js'
    end

    context 'Success' do
      it 'returns school' do
        expect(assigns[:courses].count).to eq(1)
      end

      it 'returns 200 status code' do
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #show' do
    before(:each) do
      get :show, params: { school_id: school.id, id: course.id },
          xhr: true, format: 'js'
    end

    context 'Success' do
      it 'returns course' do
        expect(assigns[:course].id).to eq(course.id)
      end

      it 'returns 200 status code' do
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET new' do
    context 'Success' do
      before :each do
        get :new, params: { school_id: school.id }, xhr: true, format: 'js'
      end

      it 'returns status 204' do
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'POST create' do
    context 'Success' do
      before :each do
        post :create,
             params: {
              school_id: school.id, course: attributes_for(:course).merge(school_id: school.id)
             },
             xhr: true, format: 'js'
      end

      it 'returns 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'returns created object' do
        expect(assigns[:course].id).not_to be_nil
      end
    end

    context 'Failure' do
      before :each do
        post :create,
             params: { school_id: school.id, course: attributes_for(:course) },
             xhr: true, format: 'js'
      end

      it 'returns created object' do
        expect(assigns[:course].id).to be_nil
      end
    end
  end

  describe 'GET edit' do
    before(:each) do
      get :edit, params: { school_id: school.id, id: course.id }, xhr: true
    end

    context 'Success' do
      it 'returns the selected course' do
        expect(assigns[:course].id).to eq(course.id)
      end

      it 'returns js' do
        expect(response.content_type).to eq('text/javascript')
      end

      it 'returns status 200' do
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'PUT update' do
    context 'Success' do
      before(:each) do
        put :update,
            params: {
              id: course.id, school_id: school.id,
              course: { title: 'Test' }
            }, xhr: true, format: 'js'
        course.reload
      end

      it 'returns js' do
        expect(response.content_type).to eq('text/javascript')
      end

      it 'returns status 200' do
        expect(response.status).to eq(200)
      end

      it 'returns updated course' do
        expect(assigns[:course].title).to eq('Test')
      end
    end

    context 'Failure' do
      before(:each) do
        put :update, params: {
          id: course.id, school_id: school.id,
          course: { title: nil }
        }, xhr: true, format: 'js'
      end

      it 'returns updated course' do
        expect(assigns[:course].errors).not_to be_empty
      end
    end
  end
end
