class DisciplinasController < ApplicationController
  def index ; end
  def create
    flash[:notice] = "Disciplina adicionada com sucesso!"

  	redirect_to disciplinas_path
  end
  
end
