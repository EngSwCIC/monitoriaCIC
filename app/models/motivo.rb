class Motivo < ApplicationRecord
    belongs_to:organization,:class_name=>'User',:foreign_key=>'user_id'
    CLASS_LIST=["Duvida","Pergunta","Falar com o coordenador"]
end
