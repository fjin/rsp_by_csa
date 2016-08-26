class CsasController < ApplicationController
  def index
    @csas = Csa.all
  end

  def show
    @csa = Csa.find(params[:id])
  end

  def new
    @csa = Csa.new
  end

  def edit
    @csa = Csa.find(params[:id])
  end

  def create
    @csa = Csa.new(csa_params)

    if @csa.save
      redirect_to @csa
    else
      render 'new'
    end
  end

  def update
    @csa = Csa.find(params[:id])

    if @csa.update(csa_params)
      redirect_to @csa
    else
      render 'edit'
    end
  end

  def destroy
    @csa = Csa.find(params[:id])
    @csa.destroy

    redirect_to csa_params
  end

  private
  def csa_params
    params.require(:csa).permit(:code, :name)
  end

end
