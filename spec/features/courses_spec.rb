require 'rails_helper'

describe "Courses" do
  context "List courses" do
    it "shows a page of courses" do
      visit courses_path

      expect(page).to have_content "Cursos"
    end

    context "When there is not courses created" do
      it "shows message of no courses created" do
        visit courses_path

        expect(page).to have_content "Não existem cursos cadastrados"
      end
    end

    context "When there is courses created" do
      let!(:courses) { create_list(:course, 2) }

      it "shows a list of courses already created" do
        visit courses_path

        expect(page).to have_content courses.first.title
        expect(page).to have_content courses.last.title
      end

      context "Destroy courses" do
        let(:course_to_delete) { courses.first }

        it "allows the user to delete a course from list" do
          visit courses_path

          find("tr#course_#{course_to_delete.id} .destroy").click

          expect(page).to have_content "Excluído com sucesso"
        end

        it "removes deleted course from the list" do
          visit courses_path

          find("tr#course_#{course_to_delete.id} .destroy").click

          expect(page).to have_no_css "tr#course_#{course_to_delete.id} .destroy"
        end
      end
    end
  end
end
