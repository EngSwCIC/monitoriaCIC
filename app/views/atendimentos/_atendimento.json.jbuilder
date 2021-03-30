json.extract! atendimento, :id, :motivo_id, :dia, :descricao, :aluno_atendido, :created_at, :updated_at
json.url atendimento_url(atendimento, format: :json)
