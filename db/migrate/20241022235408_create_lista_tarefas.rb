class CreateListaTarefas < ActiveRecord::Migration[7.2]
  def change
    create_table :lista_tarefas do |t|
      t.string :nome_lista

      t.timestamps
    end
  end
end
