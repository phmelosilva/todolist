class ChangeStatusToBooleanInTarefas < ActiveRecord::Migration[7.2]
  def change
    change_column :tarefas, :status, :boolean, default: false
  end
end
