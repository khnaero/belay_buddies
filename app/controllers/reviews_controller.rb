class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_profile

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.profile_id = @profile.id

    # respond_to do |format|
      if @review.save
        redirect_to user_profile_path(@profile), notice: 'Review was successfully created.'
        # format.json { render :show, status: :created, location: @review }
      else
        render :new 
        # format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    # end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    redirect_to rooth_path, notice: 'Review was successfully destroyed.'
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_profile
      @profile = Profile.find(params[:profile_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end