class Professor < ActiveRecord::Base
  has_secure_password

  self.primary_key = :id

  def self.all_roles
    return [['Professor(a) substituto(a)', 1], ['Professor(a)', 2], ['Professor(a) Colaborador(a)', 3],
            ['Professor(a) Adjunto(a)', 4], ['Professor(a) Associado(a)', 5], ['Professor(a) Titular', 6]]
  end
end