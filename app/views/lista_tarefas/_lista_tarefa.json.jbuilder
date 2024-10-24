json.extract! lista_tarefa, :id, :nome_lista, :created_at, :updated_at
json.url lista_tarefa_url(lista_tarefa, format: :json)
