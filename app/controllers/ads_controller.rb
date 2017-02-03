class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  before_filter :allow_only_admins_and_advertisers

  def allow_only_admins_and_advertisers
    unless current_user.admin? or current_user.advertiser?
      redirect_to root_path, :flash => { :error => "Sorry, you do not have permission to access that area." }
    end
  end

  # GET /ads
  # GET /ads.json
  def index
    if current_user.admin?
      @ads = Ad.all
    elsif current_user.advertiser?
      @ads = current_user.ads
    end
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
  end

  # GET /ads/new
  def new
    @ad = Ad.new
  end

  # GET /ads/1/edit
  def edit
  end

  # POST /ads
  # POST /ads.json
  def create
    @ad = Ad.new(ad_params)
    @ad.user_id = current_user.id

    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render :show, status: :created, location: @ad }
      else
        format.html { render :new }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ads/1
  # PATCH/PUT /ads/1.json
  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      begin
        if current_user.admin?
          @ad = Ad.find(params[:id])
        else
          @ad = current_user.ads.find(params[:id])
        end
      rescue
        redirect_to ads_path, :flash => { :error => "Unable to find that ad" }
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:description, :file, :title, :user_id)
    end
end
