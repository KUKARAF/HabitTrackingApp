class ActivitiesController < ApplicationController
	respond_to :html
	def index
		@activities = Activity.where(["userId = ?", current_user.id])
	
  	end

	
	def destroy
		@activities = activities.find(params[:id])
		@activities.destroy

		respond_to do |format|
		format.html { redirect_to activities_url }
	end


	def create
	
		# render plain: params[:activity].inspect
		# @activity = Activity.new(activity_params)
		#add user id
		# @activity.userId = current_user.id
		respond_with 	 Activity.create(activity_params.merge(userId: current_user.id))

		# @activity.save
		# # # redirect_to @activity
		# respond_to do |format| 
		# 	if @activity.save 
		# 		# redirect_to @activity 
		# 	else 
		# 		format.html { render :new, notice: 'something went wrong'}
		# 	end 
		# end 	
	end 
	
	
	def new 
		@activity = Activity.new
  	end 
	  
	
	def show
		#    @activity = Activity.where(["id = ?", params[:id]]).where(["userId = ?", current_user.id])[0]
		@activity = Activity.find(params[:id])
		unless current_user.id == Integer(@activity.userId)
			redirect_to activities_url, :alert=>'fuck you' 
		end	
  	end


	def edit
	@activity = Activity.find(params[:id])
		unless current_user.id == Integer(@activity.userId)
			redirect_to activities_url, :alert=>'fuck you' 
		end	
	end

	def update
		@activities = activities.find(params[:id])
   
		if @activities.update(activities_params)
			redirect_to @activities
		else
			render 'edit'
		end
	end
   

	private
	def activities_params
	  params.require(:activities).permit(:title, :text)
	end


	def activity_params
		params.require(:activity).permit(:myName, :myDate, :myTime) #:userId
  	end
end
end