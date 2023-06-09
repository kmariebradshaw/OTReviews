class ReviewsController < ApplicationController
skip_before_action :verify_authenticity_token

	
  def new 
    @review = Review.new()
    @categories = Category.all
	end 
  def create
    @review = Review.new(review_params)
    @categories = Category.all

    if @review.save
      redirect_to @review
    else
      render 'new'
    end 
  end 
    def edit
          @review = Review.find(params[:id]) 

  end  
  def show
    @review = Review.find(params[:id]) 
  end 
  def index
    @users = User.all 
         @reviewsdownload = Review.all.order("created_at DESC")

    @reviews = Review.where(:status => 'approved').order("created_at DESC").paginate(:page => params[:page], :per_page => 250)
    @positive_review_count = Review.where("rating > ?", 3).count()
   respond_to do |format|
    format.html
    format.csv { send_data @reviewsdownload.to_csv, filename: "Reviews-#{Date.today}.csv" }
    end
  end 
  def update
    @review = Review.find(params[:id]) 
    if @review.update(review_params)
      redirect_to '/welcome/new'
     else
      render 'edit'
    end
  end

  private 
  def review_params
      params.require(:review).permit(:verification, :favorite, :title, :text, :rating, :status, :product_id, :author_first, :author_last, :author_email, :staff_favorite, :vote, :created_at, :sticky)
  end 
end
