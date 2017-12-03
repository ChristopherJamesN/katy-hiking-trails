class TrailsController < ApplicationController
  before_action :set_trail, only: [:show, :edit, :update, :destroy]

  def index
    @trail_users = TrailUser.all
  end

  def show
  end

  def edit
  end

  # PATCH/PUT /trails/1
  # PATCH/PUT /trails/1.json
  def update
    respond_to do |format|
      if @trail_user.update(trail_user_params)
        format.html { redirect_to @trail, notice: 'Comment was successfully added.' }
        format.json { render :show, status: :ok, location: @trail_user }
      else
        format.html { render :edit }
        format.json { render json: @trail_user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_trail
      @trail_user = TrailUser.find(params[:id])
    end

    def trail_user_params
      params.require(:trail_user).permit(:comments)
    end
end
