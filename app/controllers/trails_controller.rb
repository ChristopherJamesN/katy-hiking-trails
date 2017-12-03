class TrailsController < ApplicationController
  before_action :set_trail, only: [:show, :edit, :update, :destroy]

  # GET /trails
  # GET /trails.json
  def index
    @trails = Trail.all
  end

  def favorites
    @trails = current_user.trails
    render :index
  end

  def favorite
    @trail = Trail.find(params[:id])
    @trail.users << current_user
    @trails = current_user.trails
    render :index
  end

  def remove
    @trail = Trail.find(params[:id])
    @trail.users.delete(current_user)
    @trails = current_user.trails
    render :index
  end

  def barker
    @trails = Trail.where(reservoir: 'barker')
    render :index
  end

  def addicks
    @trails = Trail.where(reservoir: 'addicks')
    render :index
  end

  def home
  end

  # GET /trails/1
  # GET /trails/1.json
  def show
    @trail_user = TrailUser.find_by(user_id: current_user.id, trail_id: @trail.id)
  end

  # GET /trails/new
  def new
    @trail = Trail.new
  end

  # GET /trails/1/edit
  def edit
  end

  # POST /trails
  # POST /trails.json
  def create
    @trail = Trail.new(trail_params)

    respond_to do |format|
      if @trail.save
        format.html { redirect_to @trail, notice: 'Trail was successfully created.' }
        format.json { render :show, status: :created, location: @trail }
      else
        format.html { render :new }
        format.json { render json: @trail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trails/1
  # PATCH/PUT /trails/1.json
  def update
    @trail_user = TrailUser.find_or_create_by(user_id: current_user.id, trail_id: @trail.id)
    @trail_user.comments << params[:trail][:notes]
    redirect_to @trail, notice: 'Comment was successfully added.'
    #respond_to do |format|
    #  if @trail.update_attribute(:notes, @trail.notes.push(trail_params[:notes].to_s))
    #    format.html { redirect_to @trail, notice: 'Comment was successfully added.' }
    #    format.json { render :show, status: :ok, location: @trail }
    #  else
    #    format.html { render :edit }
    #    format.json { render json: @trail.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /trails/1
  # DELETE /trails/1.json
  def destroy
    @trail.destroy
    respond_to do |format|
      format.html { redirect_to trails_url, notice: 'Trail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_trail
      @trail = Trail.find(params[:id])
    end

    def trail_params
      params.require(:trail).permit(:name, :description, :notes, :maplink)
    end
end
