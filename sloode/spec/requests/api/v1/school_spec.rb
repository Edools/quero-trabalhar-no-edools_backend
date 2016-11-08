require 'rails_helper'

RSpec.describe Rest::V1::SchoolsController, type: :request do
  describe 'GET #index' do
    before(:each) do
      create(:school)
      get '/rest/v1/schools?fields=id'
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

    before(:each) do
      get "/rest/v1/schools/#{school.id}?fields=id,name"
    end

    it 'returns success' do
      expect(response).to be_success
    end

    it 'retrieves a school' do
      expect(json['data']['attributes']['id']).to eq(school.id)
      expect(json['data']['attributes']['name']).to eq(school.name)
      expect(json['data']['attributes']['email']).to eq(school.email)
      expect(json['data']['attributes']['pitch']).to eq(school.pitch)
      expect(json['data']['attributes']['subdomain']).to eq(school.subdomain)
    end
  end

  describe 'GET #count_active_students' do
    let(:school) { create(:school) }

    before do
      create(:course, active_students: 20, school_id: school.id)
      get "/rest/v1/schools/#{school.id}/students"
    end

    it 'returns success' do
      expect(response).to be_success
    end

    it 'retrieves school.id and active students' do
      expect(json['data']['attributes']['school_id']).to eq(school.id)
      expect(json['data']['attributes']['active_students']).to eq(20)
    end
  end

  describe 'GET #search' do
    before do
      create(:school, name: 'João Ribeiro')
      create(:school, name: 'Carlos Alberto')
      get "/rest/v1/schools/search?q=carlos"
    end

    it 'returns success' do
      expect(response).to be_success
    end

    it "searches in schools" do
      expect(json['data'][0]['attributes']['name']).to eq('Carlos Alberto')
      expect(json['data'].length).to eq 1
    end
  end
end
