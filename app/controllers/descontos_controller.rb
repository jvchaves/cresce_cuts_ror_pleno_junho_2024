class DescontosController < ApplicationController
  before_action :set_desconto, only: %i[ show edit update destroy ]

  # GET /descontos or /descontos.json
  def index
    @descontos = Desconto.all
    @loja = Loja.first
  end

  # GET /descontos/1 or /descontos/1.json
  def show
  end

  # GET /descontos/new
  def new
    @desconto = Desconto.new
    @produtos = Produto.all
  end

  # GET /descontos/1/edit
  def edit
    @produtos = Produto.all
  end

  # POST /descontos or /descontos.json
  def create
    @desconto = Desconto.new(desconto_params)

    respond_to do |format|
      if @desconto.save
        format.html { redirect_to desconto_url(@desconto), notice: "Desconto was successfully created." }
        format.json { render :show, status: :created, location: @desconto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @desconto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /descontos/1 or /descontos/1.json
  def update
    respond_to do |format|
      if @desconto.update(desconto_params)
        format.html { redirect_to desconto_url(@desconto), notice: "Desconto was successfully updated." }
        format.json { render :show, status: :ok, location: @desconto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @desconto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descontos/1 or /descontos/1.json
  def destroy
    @desconto.destroy

    respond_to do |format|
      format.html { redirect_to descontos_url, notice: "Desconto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desconto
      @desconto = Desconto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def desconto_params
      params.require(:desconto).permit(:produto_id, :nome, :descricao, :tipo, :status, :preco, :leve, :pague, :percentual_desconto, :preco_de, :preco_por, :ativacao, :inativacao)
    end
end
