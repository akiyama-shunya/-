class ImagesController < ApplicationController
  before_filter :authenticate_designer!
	def index_d
	@images = Image.limit(20)
	end
	
	def new
	@image = Image.new
	end
	
	def create
	upload_file = image_params[:file]
	image = {}
		if upload_file  != nil
		image[:filename] = upload_file.original_filename
		image[:file] = upload_file.read
		end
	@image = Image.new(image)
		if @image.save
		flash[:success] = "画像を保存しました!"
		redirect_to controller:'images', action: 'index_d'
		else
		flash[:error] = "保存出来ませんでした!"
		end
	end
	
	def show_image
	@image = Image.find(params[:id])
	send_data @image.file, :type => 'image/jpeg', :disposition => 'inline'
	end
	
	private
	
	def image_params
	params.require(:image).permit(
		:filename, :file
	)
	end
end
