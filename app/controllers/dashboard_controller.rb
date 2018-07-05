class DashboardController < ApplicationController
  before_action :user_logged

  def index; end

  def edit_user
    if current_user.kind_of?(User)
      @user = current_user
    elsif current_user.kind_of?(Professor)
      @professor = current_user
    else
      flash[:danger] = "Apenas alunos e professores podem editar o perfil!"
      redirect_to dashboard_path
    end
  end

  def dados_bancarios; end

  def turmas; end

  def monitorias
    @user = current_user
    @monitorias = Array.new
    Monitoria.find_each do |m|
      if @user.kind_of?(User)
        if m.fk_matricula == @user.matricula
          @monitorias << m
        end
      end
    end
  end

  def disciplinas
    @disciplinas = Disciplina.find_each
  end

  def apagar_alunos
    @users = User.order(:matricula)
  end

  def deletar_aluno
    @matricula = params[:user][:matricula]
    if @matricula.length == 0
      @matricula = nil
    end
    @user = User.find_by_matricula(@matricula)

    if !@user.nil?
      @dados_bancarios = DadosBancarios.where(id: @user.fk_banco)
      if !@dados_bancarios.nil?
        DadosBancarios.delete(@dados_bancarios)
      end

      @monitoria = Monitoria.where(fk_matricula: @user.matricula)
      if !@monitoria.nil?
        Monitoria.delete(@monitoria)
      end

      @user = User.delete(@user.id)
      flash[:notice] = 'Aluno apagado com sucesso!'
    else
      if !@matricula.nil?
        flash[:danger] = "Aluno de matrícula #{@matricula} não existe."
      else
        flash[:danger] = "Digite uma matrícula para deletar algum aluno."
      end
    end

    redirect_to dashboard_apagar_alunos_path
  end

  private
  def user_logged
    if !logged_in?
      redirect_to new_session_path, notice: "Você precisa estar logado para acessar essa página"
    end
  end
end
