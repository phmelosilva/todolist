class TarefasController < ApplicationController
  before_action :set_tarefa, only: %i[ show edit update destroy ]

  # GET /tarefas or /tarefas.json
  def index
    @tarefas = Tarefa.all
  end

  # GET /tarefas/1 or /tarefas/1.json
  def show
  end

  # GET /tarefas/new
  def new
    @tarefa = Tarefa.new
  end

  # GET /tarefas/1/edit
  def edit
  end

  # POST /tarefas or /tarefas.json
  def create
    @tarefa = Tarefa.new(tarefa_params)

    if @tarefa.save
      redirect_to lista_tarefa_path(@tarefa.lista_tarefa_id)
    else
      redirect_to root_path
    end

    # respond_to do |format|
    #   if @tarefa.save
    #     format.html { redirect_to @tarefa, notice: "Tarefa was successfully created." }
    #     format.json { render :show, status: :created, location: @tarefa }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @tarefa.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /tarefas/1 or /tarefas/1.json
  def update
    @tarefa = Tarefa.find(params[:id])

    if @tarefa.update(tarefa_params)
      redirect_to lista_tarefa_path(@tarefa.lista_tarefa_id)
    else
      redirect_to_root_path
    end

    # respond_to do |format|
    #   if @tarefa.update(tarefa_params)
    #     format.html { redirect_to @tarefa, notice: "Tarefa was successfully updated." }
    #     format.json { render :show, status: :ok, location: @tarefa }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @tarefa.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update_status
    @tarefa = Tarefa.find(params[:id])
    if @tarefa.update(status: params[:tarefa][:status])
      redirect_to lista_tarefa_path(@tarefa.lista_tarefa), notice: "Tarefa atualizada com sucesso."
    else
      redirect_to lista_tarefa_path(@tarefa.lista_tarefa), alert: "Erro ao atualizar a tarefa."
    end
  end

  def restore_status
    @tarefa = Tarefa.find(params[:id])
    if @tarefa.update(status: false) 
      redirect_to lista_tarefa_path(@tarefa.lista_tarefa), notice: "Tarefa restaurada para 'em andamento'."
    else
      redirect_to historico_lista_tarefa_path(@tarefa.lista_tarefa), alert: "Erro ao restaurar a tarefa."
    end
  end

  # DELETE /tarefas/1 or /tarefas/1.json
  def destroy
    @tarefa = Tarefa.find(params[:id])
    @tarefa.destroy!
    redirect_to lista_tarefa_path(@tarefa.lista_tarefa), notice: "Tarefa excluída com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarefa
      @tarefa = Tarefa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tarefa_params
      params.require(:tarefa).permit(:nome_tarefa, :status, :lista_tarefa_id, :etiquetas, :prazo, :lista_tarefa_id)
    end
end
