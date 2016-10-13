class TokimonsController < ApplicationController
  before_action :set_tokimon, only: [:show, :edit, :update, :destroy]

  # GET /tokimons
  # GET /tokimons.json
  def index
    @tokimons = Tokimon.all
  end

  # GET /tokimons/1
  # GET /tokimons/1.json
  def show
  end

  # GET /tokimons/new
  def new
    @tokimon = Tokimon.new
  end

  # GET /tokimons/1/edit
  def edit
  end

  # POST /tokimons
  # POST /tokimons.json
  def create
    @tokimon = Tokimon.new(tokimon_params)

    respond_to do |format|
      if @tokimon.save
        format.html { redirect_to @tokimon, notice: 'Tokimon was successfully created.' }
        format.json { render :show, status: :created, location: @tokimon }
      else
        format.html { render :new }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tokimons/1
  # PATCH/PUT /tokimons/1.json
  def update
    respond_to do |format|
      tokimon_errors = []
      tokimon_params.each do |name, value|
        if ['fly', 'fight', 'fire', 'water', 'electric', 'ice'].include? name
          # @tokimon.errors[:base] << name
          # @tokimon.errors[:base] << value
          if value == ""
            tokimon_errors << "#{name} has no value."
          end
          if !(value == "") and value.to_i > 100
            tokimon_errors << "#{name} is greater than the maximum value of 100."
          end
          if !(value == "") and value.to_i < 0
            tokimon_errors << "#{name} is smaller than the minimum value of 0."
          end
        end
      end
      if @tokimon.update(tokimon_params) and tokimon_errors.count == 0
        format.html { redirect_to @tokimon, notice: "Tokimon was successfully updated." }
        format.json { render :show, status: :ok, location: @tokimon }
      else
        tokimon_errors.each do |error|
          @tokimon.errors[:base] << error
        end
        format.html { render :edit }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tokimons/1
  # DELETE /tokimons/1.json
  def destroy
    @tokimon.destroy
    respond_to do |format|
      format.html { redirect_to tokimons_url, notice: 'Tokimon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tokimon
      @tokimon = Tokimon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tokimon_params
      params.require(:tokimon).permit(:tname, :trainer_id, :weight, :height, :elementtype, :fly, :fight, :fire, :water, :electric, :ice, :total)
    end
end
