class ServicesController < ApplicationController
before_action :authenticate_admin!, only:[:new, :destroy, :edit]
	
	def index
		@services = Service.all
	end

	def show
		@service = Service.find(params[:id])
	end

	def new 
		@service = Service.new
	end

	def create
		@service = Service.new(service_params)
		@service.save
		redirect_to services_path
	end

	def edit 
		@service = Service.find(params[:id])
	end

	def update
		@service = Service.update(service_params)
	end

	def destroy 
		@service.find(param[:id])
		if @service.destroy!
			redirect_to services_path
		else
			redirect_to service_path
		end
	end

	private

	def service_params
		params.require(:service).permit(:name, :description)
	end
end
