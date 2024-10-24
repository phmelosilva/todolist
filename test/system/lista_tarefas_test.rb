require "application_system_test_case"

class ListaTarefasTest < ApplicationSystemTestCase
  setup do
    @lista_tarefa = lista_tarefas(:one)
  end

  test "visiting the index" do
    visit lista_tarefas_url
    assert_selector "h1", text: "Lista tarefas"
  end

  test "should create lista tarefa" do
    visit lista_tarefas_url
    click_on "New lista tarefa"

    fill_in "Nome lista", with: @lista_tarefa.nome_lista
    click_on "Create Lista tarefa"

    assert_text "Lista tarefa was successfully created"
    click_on "Back"
  end

  test "should update Lista tarefa" do
    visit lista_tarefa_url(@lista_tarefa)
    click_on "Edit this lista tarefa", match: :first

    fill_in "Nome lista", with: @lista_tarefa.nome_lista
    click_on "Update Lista tarefa"

    assert_text "Lista tarefa was successfully updated"
    click_on "Back"
  end

  test "should destroy Lista tarefa" do
    visit lista_tarefa_url(@lista_tarefa)
    click_on "Destroy this lista tarefa", match: :first

    assert_text "Lista tarefa was successfully destroyed"
  end
end
