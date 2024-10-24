require "test_helper"

class ListaTarefasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lista_tarefa = lista_tarefas(:one)
  end

  test "should get index" do
    get lista_tarefas_url
    assert_response :success
  end

  test "should get new" do
    get new_lista_tarefa_url
    assert_response :success
  end

  test "should create lista_tarefa" do
    assert_difference("ListaTarefa.count") do
      post lista_tarefas_url, params: { lista_tarefa: { nome_lista: @lista_tarefa.nome_lista } }
    end

    assert_redirected_to lista_tarefa_url(ListaTarefa.last)
  end

  test "should show lista_tarefa" do
    get lista_tarefa_url(@lista_tarefa)
    assert_response :success
  end

  test "should get edit" do
    get edit_lista_tarefa_url(@lista_tarefa)
    assert_response :success
  end

  test "should update lista_tarefa" do
    patch lista_tarefa_url(@lista_tarefa), params: { lista_tarefa: { nome_lista: @lista_tarefa.nome_lista } }
    assert_redirected_to lista_tarefa_url(@lista_tarefa)
  end

  test "should destroy lista_tarefa" do
    assert_difference("ListaTarefa.count", -1) do
      delete lista_tarefa_url(@lista_tarefa)
    end

    assert_redirected_to lista_tarefas_url
  end
end
