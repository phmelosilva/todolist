class ListaTarefa < ApplicationRecord
    has_many :tarefas, dependent: :destroy
    validates :tarefas, length: { maximum: 10 }
end
