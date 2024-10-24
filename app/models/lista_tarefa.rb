class ListaTarefa < ApplicationRecord
    has_many :tarefas
    validates :tarefas, length: { maximum: 10 }
end
