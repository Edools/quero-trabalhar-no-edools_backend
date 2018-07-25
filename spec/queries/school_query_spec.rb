require 'rails_helper'

RSpec.describe SchoolQuery do
  
  before do
    @current_user_admin = create(:admin)
    @school = create(:school, user: @current_user_admin)
  end

  describe "testing relation" do
    subject (:all) { described_class.relation }

    it 'return all schools' do
      expect(all.size).to eq(1)
    end
  end

  describe 'testing search by_title' do
    
    subject (:by_name) { described_class.relation.by_name(@school.name) }
    subject (:by_name_param_nil) { described_class.relation.by_name('') }
    it 'return query with title' do
      expect(by_name.to_sql).to include("#{@school.name}")
    end

    it 'return query with title' do
      expect(by_name_param_nil.to_sql).to eq(described_class.relation.to_sql)
    end
  end
end