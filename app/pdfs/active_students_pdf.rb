class ActiveStudentsPDF < Prawn::Document
  def initialize(enrollments, current_user)
    super()

    @enrollments = enrollments
    @current_user = current_user

    header()
    students_table()
  end

  def header
    fill_color "40464e"

    move_down 50
    bounding_box [bounds.left, bounds.bottom], :width  => bounds.width do
      stroke_color 'FFFFFF'
      stroke_bounds
      stroke do
        stroke_color '663366'
        fill_color '663366'
        fill_and_stroke_rounded_rectangle [0,690], 170, 15, 0

        stroke_color '999966'
        fill_color '999966'
        fill_and_stroke_rounded_rectangle [180,690], 170, 15, 0

        stroke_color '666699'
        fill_color '666699'
        fill_and_stroke_rounded_rectangle [360,690], 170, 15, 0
        fill_color '000000'
      end
    end

    bounding_box [660, bounds.bottom + 50], :width  => bounds.width do
      stroke_color 'FFFFFF'
      stroke_bounds
      stroke do
        stroke_color '663366'
        fill_color 'FEDAFA'
        fill_and_stroke_rounded_rectangle [0, 650], 180, 15, 0
        fill_color '000000'
      end
    end

    move_down 30

    text 'nandooliveira.al@gmail.com'
    move_down 5
    text 'http://edools-test.herokuapp.com'

    text_box "Active Students",
      :size => 30, :style => :bold, :align => :right, :at=> [320, 635], :width => 200, :height => 100
  end

  def students_table
      move_down 80
      text "Active Students:", :size => 16
      move_down 10

      general_table_data = [['ID', 'School', 'Course', 'Student']]
      @enrollments.each do |enrollment|
        general_table_data.push([enrollment.id, enrollment.course.school.to_s, enrollment.course.title, enrollment.student.to_s])
      end

      table(
        general_table_data,
        :header => true,
        :width => bounds.width,
        :cell_style => { size: 12, border_width: 0.5, border_color: "D5D4D5" }
      ) do |table|
        table.row(0).background_color = "F2F2F2"
        table.row(0).font_style = :bold
      end
    end
end
