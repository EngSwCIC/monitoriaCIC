json.extract! tarefa, :id, :titulo, :descricao, :nota, :feito, :inicio, :fim, :monitoria_id, :created_at, :updated_at
json.url tarefa_url(tarefa, format: :json)
