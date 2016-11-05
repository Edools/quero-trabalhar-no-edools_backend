class SchoolsController < ApplicationController

    #index, show, new, edit, create, update, destroy

    def index
      search = params[:search]
      if search != nil
        @schools = School.where("name LIKE ?", "%#{search}%")
      else
        @schools = School.all
      end
    end

    def show
      @school = School.find(params[:id])
    end

    def new
      @school = School.new
    end

    def edit
      @school = School.find(params[:id])
    end

    def create
      @school = School.new(school_params)
      if @school.invalid?
        render 'new', status: :bad_request
      elsif @school.save
        flash[:notice] = "Escola criada com sucesso!"
        redirect_to @school
      else
        render 'new', status: :internal_server_error
      end
    end

    def update
      @school = School.find(params[:id])
      if @school.update(school_params)
        flash[:notice] = "Escola atualizada com sucesso!"
        redirect_to @school
      else
        render 'edit', status: :bad_request
      end
    end

    def destroy
      @school = School.find(params[:id])
      @school.destroy

      redirect_to schools_path
    end

    def active_students
      @school = School.find(params[:id])

      #create an array for inactive students
      @inactive_students = []

      #create an array for active students
      @active_students = []

      if @school.students.count > 0
        #get all students which are enrolled in courses
        @school.courses.each do |c|
          @active_students += c.students
        end

        #remove duplicates
        @active_students = @active_students.uniq

        #get all school students
        @inactive_students = @school.students

        #remove active students of the array with all students
        @inactive_students = @inactive_students - @active_students
      end

    end

    private
      def school_params
        params.require(:school).permit(:name, :owner_email, :pitch, :subdomain)
      end

end
