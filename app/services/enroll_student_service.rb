class EnrollStudentService
  def enroll(student, course, active = true)
    unless student.courses.include?(course)
      Enrollment.create(student: student, course: course, active: active)
    else
      Enrollment.find_by(student_id: student.id, course_id: course.id)
    end
  end

  def unenroll(student, course)
    student.enrollments.find_by(course_id: course.id).destroy
  end
end