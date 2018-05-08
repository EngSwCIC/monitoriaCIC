class HomeController < ApplicationController
  def index ; end

  def registrar
    permitted = params.require(:aluno).permit(:nome,:matricula,:email,:cpf,:rg,:senha)
    if params[:senha] == params[:conSenha]
      @aluno = Aluno.create!(permitted)
      flash[:notice] = "Usuário cadastrado com sucesso!"
    else
      flash[:notice] = "Senhas não são iguais. Usuário não cadastrado."
    end
    redirect_to root_path
  end
end