class ImageScaffoldsController < ApplicationController
  before_action :set_image_scaffold, only: [:show, :edit, :update, :destroy]

  # GET /image_scaffolds
  # GET /image_scaffolds.json
  def index
    @image_scaffolds = ImageScaffold.all
  end

  # GET /image_scaffolds/1
  # GET /image_scaffolds/1.json
  def show
  end

  # GET /image_scaffolds/new
  def new
    @image_scaffold = ImageScaffold.new
  end

  # GET /image_scaffolds/1/edit
  def edit
  end

  # POST /image_scaffolds
  # POST /image_scaffolds.json
  def create
    @image_scaffold = ImageScaffold.new(image_scaffold_params)

    respond_to do |format|
      if @image_scaffold.save
        format.html { redirect_to @image_scaffold, notice: 'Image scaffold was successfully created.' }
        format.json { render :show, status: :created, location: @image_scaffold }
      else
        format.html { render :new }
        format.json { render json: @image_scaffold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_scaffolds/1
  # PATCH/PUT /image_scaffolds/1.json
  def update
    respond_to do |format|
      if @image_scaffold.update(image_scaffold_params)
        format.html { redirect_to @image_scaffold, notice: 'Image scaffold was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_scaffold }
      else
        format.html { render :edit }
        format.json { render json: @image_scaffold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_scaffolds/1
  # DELETE /image_scaffolds/1.json
  def destroy
    @image_scaffold.destroy
    respond_to do |format|
      format.html { redirect_to image_scaffolds_url, notice: 'Image scaffold was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_scaffold
      @image_scaffold = ImageScaffold.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_scaffold_params
      params.require(:image_scaffold).permit(:title, :description, :image)
    end
end
