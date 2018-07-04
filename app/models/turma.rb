class Turma < ActiveRecord::Base
  def self.qnt_bolsas
    @qnt_bolsas = []

    for i in 1..10
      @vaga = []
      @vaga = [i.to_s, i]
      @qnt_bolsas.insert(-1, @vaga)
    end

    return @qnt_bolsas
  end

  def self.sel_disciplinas
    @disciplinas = Disciplina.select('cod_disciplina', 'nome')

    @select = []
    @disciplinas.each do |disciplina|
      @atual = []
      @atual = [disciplina.nome, disciplina.cod_disciplina]
      @select.insert(-1, @atual)
    end

    return @select
  end

  def self.show_disciplinas
    @disciplinas = Disciplina.select('nome')
    @show = []

    @disciplinas.each do |disciplina|
      @atual = String.new
      @atual = disciplina.nome
      @show.insert(-1, @atual)
    end

    return @show
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
end