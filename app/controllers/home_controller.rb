class HomeController < ApplicationController
  def index ; end

  def registrar
    permitted = params.require(:aluno).permit(:nome,:matricula,:email,:cpf,:rg,:senha)

    self.params = params.permit!
    @senha = params[:aluno][:senha]
    @conSenha = params[:aluno][:conSenha]
    @nome = params[:aluno][:nome]
    @matricula = params[:aluno][:matricula]
    @email = params[:aluno][:email]
    @cpf = params[:aluno][:cpf]
    @rg = params[:aluno][:rg]
    result3 = Integer(@matricula) rescue false
    result1 = Integer(@cpf) rescue false
    result2 = Integer(@rg) rescue false

    if @nome == "" || @email == "" || @senha == "" || result1 == false || result2 == false || result3 == false
        flash[:notice] = "Por favor preencha os campos corretamente."
    else
        if @senha == @conSenha
          @aluno = Aluno.create!(permitted)
          flash[:notice] = "Usuário cadastrado com sucesso!"
        else
          flash[:notice] = "Senhas não são iguais. Usuário não cadastrado."
        end
    end
    redirect_to root_path
  end
end
