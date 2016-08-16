class CsasController < ApplicationController
  def index
    @csas = Csa.all

  end
end
