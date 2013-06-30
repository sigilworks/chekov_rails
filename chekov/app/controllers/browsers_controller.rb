class BrowsersController < ApplicationController
  before_action :set_browser, only: [:show, :edit, :update, :destroy]

  # GET /browsers
  # GET /browsers.json
  def index
    @browsers = Browser.all
  end

  # GET /browsers/1
  # GET /browsers/1.json
  def show
  end

  # GET /browsers/new
  def new
    @browser = Browser.new
  end

  # GET /browsers/1/edit
  def edit
  end

  # POST /browsers
  # POST /browsers.json
  def create
    @browser = Browser.new(browser_params)

    respond_to do |format|
      if @browser.save
        format.html { redirect_to @browser, notice: 'Browser was successfully created.' }
        format.json { render action: 'show', status: :created, location: @browser }
      else
        format.html { render action: 'new' }
        format.json { render json: @browser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /browsers/1
  # PATCH/PUT /browsers/1.json
  def update
    respond_to do |format|
      if @browser.update(browser_params)
        format.html { redirect_to @browser, notice: 'Browser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @browser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /browsers/1
  # DELETE /browsers/1.json
  def destroy
    @browser.destroy
    respond_to do |format|
      format.html { redirect_to browsers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_browser
      @browser = Browser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def browser_params
      params.require(:browser).permit(:name, :shortname)
    end
end
