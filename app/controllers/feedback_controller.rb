class FeedbackController < ApplicationController
    before_action :set_user_feedback, only: %i[ show edit update destroy ]

  # GET /user_feedbacks or /user_feedbacks.json
  def index
    @user_feedbacks = Feedback.all
  end

  # GET /user_feedbacks/1 or /user_feedbacks/1.json
  def show
     @user_feedback = Feedback.find(params[:id])
  end

  # GET /user_feedbacks/new
  def new
    @user_feedback = Feedback.new
  end

  # GET /user_feedbacks/1/edit
  def edit
    @user_feedback = Feedback.find(params[:id])
  end

  # POST /user_feedbacks or /user_feedbacks.json
  def create
    @user_feedback = Feedback.new(user_feedback_params)
    byebug

    respond_to do |format|
      if @user_feedback.save
        format.html { redirect_to feedback_index_path, notice: "user feedback was successfully created." }
        format.json { render :index, status: :created, location: feedback_index_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_feedbacks/1 or /user_feedbacks/1.json
  def update
    respond_to do |format|
      if @user_feedback.update(user_feedback_params)
        format.html { redirect_to feedback_index_path, notice: "user feedback was successfully updated." }
        format.json { render :index, status: :ok, location: feedback_index_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_feedbacks/1 or /user_feedbacks/1.json
  def destroy
    @user_feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedback_index_path, notice: "user feedback was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_feedback
      @user_feedback = Feedback.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_feedback_params
      locale_params = I18n.available_locales.map do |local|
      [:"name_#{Mobility.normalize_locale(local)}", :"email_#{Mobility.normalize_locale(local)}", :"role_#{Mobility.normalize_locale(local)}", :"feedback_#{Mobility.normalize_locale(local)}"]
      end.flatten
      byebug
      params.require(:feedback).permit(locale_params)
    end
end
