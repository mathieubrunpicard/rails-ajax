class GossipsController < ApplicationController


  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create(gossip_params)
    if @gossip.save
      flash["success"] = "Gossip created"
    redirect_to gossips_path
  else
    flash["danger"] = "Your gossip has not been created"
  end
  end

  def index
    @gossips = Gossip.all
  end

private

  def gossip_params
    params.require(:gossip).permit(:title, :body)
  end
end
