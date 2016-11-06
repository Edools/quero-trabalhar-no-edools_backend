class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course, notice: "Curso criado com sucesso."
    else
      flash[:alert] = "Erro ao criar o curso."
      render "new"
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to @course, notice: "Curso atualizado com sucesso."
    else
      redirect_to root_path, alert: "Erro ao atualizar o curso."
    end
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      redirect_to root_path, notice: "Curso excluído com sucesso."
    else
      redirect_to root_path, alert: "Erro ao excluir o curso."
    end

  end

  private

  def course_params
    params.require(:course).permit(:titulo,:escola_id,:descricao,:duracao,:data_criacao,:alunos_ativos,:preco)
  end
end
