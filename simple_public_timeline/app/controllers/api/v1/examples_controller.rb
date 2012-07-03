class Api::V1::ExamplesController < Api::ApisController
  
  def index
    @examples = Example.all
	end
	
	def create
		@example = Example.create!(params[:example])
	end
	
	def show
	  @example = Example.find(params[:id])
  end
  
  def update
    @example = Example.find(params[:id])
    @example.update_attributes!(params[:example])
  end
  
  def destroy
    @example = Example.find(params[:id])
    @example.destroy
  end

end