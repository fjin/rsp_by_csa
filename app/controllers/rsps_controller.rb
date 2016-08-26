class RspsController < ApplicationController

  def index
    @rsps = Rsp.all
  end

  def show
    @rsp = Rsp.find(params[:id])
  end

  def new
    @rsp = Rsp.new
  end

  def edit
    @rsp = Rsp.find(params[:id])
  end

  def create
    @rsp = Rsp.new(rsp_params)

    if @rsp.save
      redirect_to @rsp
    else
      render 'new'
    end
  end

  def update
    @rsp = Rsp.find(params[:id])

    if @rsp.update(rsp_params)
      redirect_to @rsp
    else
      render 'edit'
    end
  end

  def destroy
    @rsp = Rsp.find(params[:id])
    @rsp.destroy

    redirect_to rsp_params
  end

  private
  def rsp_params
    params.require(:rsp).permit(:home_phone, :business_phone, :home_website,
                                :fibre_website, :satellite_website, :wireless_website,
                                :business_website, :business_name, :name,
                                :logo_name, :service, :rsp_type)
  end


end
