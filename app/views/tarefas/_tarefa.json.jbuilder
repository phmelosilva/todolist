json.extract! tarefa, :id, :nome_tarefa, :status, :lista_tarefa_id, :etiquetas, :prazo, :created_at, :updated_at
json.url tarefa_url(tarefa, format: :json)
