class CreateTarefas < ActiveRecord::Migration[7.2]
  def change
    create_table :tarefas do |t|
      t.string :nome_tarefa
      t.string :status
      t.references :lista_tarefa, null: false, foreign_key: true
      t.string :etiquetas
      t.datetime :prazo

      t.timestamps
    end
  end
end
