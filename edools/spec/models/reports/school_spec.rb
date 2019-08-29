require 'rails_helper'

describe Reports::School do
  let(:school) { create(:school) }
  subject { described_class.new(school.id) }

  describe '#report_params' do
    context 'when have active students older than one month' do
      it 'should return params correctly' do
        create_courses(3, Date.current - 2.months)
        create_courses(2, Date.current)

        params = subject.send(:report_params)

        expected_params = {
          school_id: school.id,
          month_active_students: 20,
          accumulated_active_students: 50
        }

        expect(params).to eq(expected_params)
      end
    end

    context 'when have active students only at current month' do
      it 'should return params correctly' do
        create_courses(5, Date.current)

        params = subject.send(:report_params)

        expected_params = {
          school_id: school.id,
          month_active_students: 50,
          accumulated_active_students: 50
        }

        expect(params).to eq(expected_params)
      end
    end

    context 'when have no active students' do
      it 'should return params correctly' do
        params = subject.send(:report_params)

        expected_params = {
          school_id: school.id,
          month_active_students: 0,
          accumulated_active_students: 0
        }

        expect(params).to eq(expected_params)
      end
    end
  end

  def create_courses(qty = 1, date = Date.current)
    create_list(
      :course, qty, school: school, active_students: 10, created_at: date
    )
  end
end
