class Demo1sController < ApplicationController
  before_action :set_demo1, only: %i[ show edit update destroy ]

  # GET /demo1s or /demo1s.json
  def index
    @demo1s = Demo1.all
  end

  # GET /demo1s/1 or /demo1s/1.json
  def show
  end

  # GET /demo1s/new
  def new
    @demo1 = Demo1.new
  end

  # GET /demo1s/1/edit
  def edit
  end

  # POST /demo1s or /demo1s.json
  def create
    @demo1 = Demo1.new(demo1_params)

    respond_to do |format|
      if @demo1.save
        format.html { redirect_to @demo1, notice: "Demo1 was successfully created." }
        format.json { render :show, status: :created, location: @demo1 }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @demo1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demo1s/1 or /demo1s/1.json
  def update
    respond_to do |format|
      if @demo1.update(demo1_params)
        format.html { redirect_to @demo1, notice: "Demo1 was successfully updated." }
        format.json { render :show, status: :ok, location: @demo1 }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @demo1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demo1s/1 or /demo1s/1.json
  def destroy
    @demo1.destroy

    respond_to do |format|
      format.html { redirect_to demo1s_path, status: :see_other, notice: "Demo1 was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def loginform
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demo1
      @demo1 = Demo1.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def demo1_params
      params.require(:demo1).permit(:name, :description, :status)
    end

end
