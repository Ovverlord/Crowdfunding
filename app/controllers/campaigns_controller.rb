class CampaignsController < ApplicationController

	before_action :set_campaign, only: [:show,:edit,:update,:destroy]

	def index
		@campaigns = Campaign.paginate(page: params[:page], per_page: 5)
	end

	def show
	end

	def new
		@campaign = Campaign.new
	end

	def create
		@campaign = Campaign.new(campaign_params)
		if @campaign.save
			redirect_to @campaign, success: 'Кампания создана'
		else
			flash.now[:danger] = 'Кампания не создана'
			render :new
		end
	end

	def edit
	end

	def update
		if @campaign.update_attributes(campaign_params)
			redirect_to @campaign, success: 'Кампания обновлена'
		else
			flash.now[:danger] = 'Кампания не обновлена'
			render :edit
		end
	end

	def destroy
		@campaign.destroy
		redirect_to campaigns_path
	end

	private
	def set_campaign
		@campaign = Campaign.find(params[:id])
	end

	def campaign_params
		params.require(:campaign).permit(:title, :summary, :body, :image, :all_tags,:category_id)
	end

end
