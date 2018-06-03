class ProfessorsController < ApplicationController
  def index ; end

  def new ; end

  def create
    @professor = Professor.create(professor_params)

    if !@professor.errors.any?
      flash[:notice] = "Registro realizado com sucesso!"
      redirect_to new_professor_path
    else
      flash[:danger] = @professor.errors.full_messages
      redirect_to new_professor_path
    end
  end

  protected

  def professor_params
    params.require(:professor).permit(:id, :name, :username, :email, :role, :password, :password_confirmation)
  end
end