# A classe Turma é responsável pelas regras de negócios relacionadas à entidade Turma.
# Para isso realiza operações na tabela Turma no banco de dados.
class Turma < ActiveRecord::Base
  def self.qnt_bolsas
    qnt_bolsas = []

    for index in 1..10
      vaga = [index.to_s, index]
      qnt_bolsas.insert(-1, vaga)
    end

    return qnt_bolsas
  end

  def self.sel_disciplinas
    disciplinas = Disciplina.select('cod_disciplina', 'nome')
    select = []
    disciplinas.each do |disciplina|
      select.insert(-1, [disciplina.nome, disciplina.cod_disciplina])
    end
    return select
  end

  def self.show_disciplinas
    disciplinas = Disciplina.select('nome')
    show = []

    disciplinas.each do |disciplina|
      show.insert(-1, disciplina.nome)
    end

    return show
  end

  def self.sel_turmas
    [
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
      'AA', 'BB', 'CC', 'DD', 'EE', 'FF', 'GG', 'HH'
    ]
  end

  def self.all_turmas
    find_each()
  end

  validates_presence_of :turma
  validates_presence_of :professor
  validates_presence_of :fk_cod_disciplina
  validates_presence_of :qnt_bolsas
  validate :turma_unica

  def turma_unica
    turmas = Turma.where(fk_cod_disciplina: fk_cod_disciplina)

    turmas.each do |elem|
      if elem.turma == turma
        errors.add(:turma, "#{turma} não é a única para a disciplina #{Disciplina.find(fk_cod_disciplina).nome}")
      end
    end
  end

  def self.criar_turma_a_partir_de_parametros (params)
    disciplina_id = Disciplina.find_by(nome: params[:disciplina]).id
    if (Disciplina.exists?(id: disciplina_id))
      Turma.create([{
          fk_cod_disciplina: disciplina_id,
          turma: params[:codigo_turma],
          professor: params[:prof_principal],
          professor_aux: params[:prof_auxiliar],
          fk_vagas_id: 1
      }])
    end
  end

end