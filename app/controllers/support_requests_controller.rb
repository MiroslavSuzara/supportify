class SupportRequestsController < ApplicationController
  before_action :find_params, only: [:show, :update, :done, :edit, :destroy]

  def index
    # @support_requests = SupportRequest.order("status DESC").all.paginate(page: params[:page], per_page: 5)
    # if params[:search]
    @support_requests = SupportRequest.order("status ASC").search(params[:keyword]).paginate(page: params[:page], per_page: 6)
    # else
    #   @support_requests = SupportRequest.order("status DESC").all.paginate(page: params[:page], per_page: 5)
  end

  def new
    @support_request = SupportRequest.new
  end

  def show
  end

  def create
    @support_request = SupportRequest.new support_params
    if @support_request.save
      flash[:notice] = "You have successfully created a New Support Request!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @support_request.update support_params
      flash[:notice] = "You have successfully updated your Support Request!"
      redirect_to @support_request
    else
      render :edit
    end
  end

  def destroy
    @support_request = SupportRequest.find params[:id]
    @support_request.destroy
    redirect_to support_requests_path
  end

  def done
    if @support_request.status == false
      @support_request.status = true
      @support_request.save
      redirect_to root_path, notice: "You have marked the Support Request as Done!"
    elsif @support_request.status == true
      @support_request.status = false
      @support_request.save
      redirect_to root_path, notice: "You have marked a Support Request as Not Done!"
    end
  end

  def search
    @support_request = SupportRequest.search params[:search]
  end

  private

  def support_params
    params.require(:support_request).permit(:name, :email, :department, :message)
  end

  def find_params
    @support_request = SupportRequest.find params[:id]
  end

end
