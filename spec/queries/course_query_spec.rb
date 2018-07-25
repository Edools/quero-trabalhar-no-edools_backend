require 'rails_helper'

RSpec.describe CourseQuery do
  
  before do
    @current_user_admin = create(:admin)
    @school = create(:school, user: @current_user_admin)
    @course = create(:course, user: @current_user_admin, school: @school)
  end

  describe "testing relation" do
    subject (:all) { described_class.relation }

    it 'return all courses' do
      expect(all.size).to eq(1)
    end
  end

  describe 'testing search by_title' do
    
    subject (:by_title) { described_class.relation.by_title(@course.title) }
    subject (:by_title_param_nil) { described_class.relation.by_title('') }
    it 'return query with title' do
      expect(by_title.to_sql).to include("#{@course.title}")
    end

    it 'return query with title' do
      expect(by_title_param_nil.to_sql).to eq(described_class.relation.to_sql)
    end
  end
end