class HomeController < ApplicationController
  def index

    InboundService.importFromInbound

  end
end
