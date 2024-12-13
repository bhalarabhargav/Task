class Demo1sController < ApplicationController
  before_action :set_demo1, only: %i[ show edit update destroy ]



  # GET /demo1s or /demo1s.json
  def index
    Rails.logger.info("Search Parameters: #{params.inspect}")
  
    # Extract sorting and search parameters
    sort_column = params[:column] || 'name'
    sort_direction = params[:direction] || 'asc'
  
    @demo1s = Demo1.search(params) # Ensure your model search method works properly
                    .order("#{sort_column} #{sort_direction}")
                    .page(params[:page])
                    .per(5)
  
    Rails.logger.info("Final Query: #{@demo1s.to_sql}")
  
    respond_to do |format|
      format.html
      format.js
    end
  end 
  
  # GET /demo1s/1 or /demo1s/1.json
  def show
    @demo1 = Demo1.find(params[:id])
   
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
    if params[:demo1][:files].present?
      params[:demo1][:files].each do |file|
        @demo1.files.attach(file)
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

  def delete_file
    @demo1 = Demo1.find(params[:id]) # Find the parent object using :id
    file_to_delete = @demo1.files.find_by(id: params[:file_id]) # Find the specific file using :file_id
  
    if file_to_delete.present?
      file_to_delete.purge # Delete the specific file
      redirect_to edit_demo1_path(@demo1), notice: 'File was successfully deleted.'
    else
      redirect_to edit_demo1_path(@demo1), alert: 'File not found.'
    end
  end
  
  
  
  def countries
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    limit = params[:limit].to_i > 0 ? params[:limit].to_i : 10
    search = params[:search].to_s.downcase.strip
  
    # Fetch all countries and filter by search term
    all_countries = CS.countries.map { |key, name| { key: key.to_s, name: name } }
    filtered_countries = all_countries.select do |country|
      country[:name].downcase.include?(search) || country[:key].downcase.include?(search)
    end
  
    # Paginate the filtered countries
    paginated_countries = filtered_countries.slice((page - 1) * limit, limit) || []
    render json: {
      countries: paginated_countries,
      page: page,
      total: filtered_countries.size
    }
  end
  
  
  
  def states
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    limit = params[:limit].to_i > 0 ? params[:limit].to_i : 10
    search = params[:search].to_s.downcase.strip
    country = params[:country]
  
    if country.present?
      all_states = CS.states(country.to_sym).map { |key, name| { key: key.to_s, name: name } }
      filtered_states = all_states.select do |state|
        state[:name].downcase.include?(search) || state[:key].downcase.include?(search)
      end
  
      paginated_states = filtered_states.slice((page - 1) * limit, limit) || []
      render json: {
        states: paginated_states,
        page: page,
        total: filtered_states.size
      }
    else
      render json: { states: [], page: 1, total: 0 }
    end
  end
  

  def cities
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    limit = params[:limit].to_i > 0 ? params[:limit].to_i : 10
    search = params[:search].to_s.downcase.strip
    state = params[:state]
    country = params[:country]
  
    if state.present? && country.present?
      all_cities = CS.cities(state.to_sym, country.to_sym).map { |city| { key: city.to_s, name: city } }
      filtered_cities = all_cities.select do |city|
        city[:name].downcase.include?(search) || city[:key].downcase.include?(search)
      end
  
      paginated_cities = filtered_cities.slice((page - 1) * limit, limit) || []
      render json: {
        cities: paginated_cities,
        page: page,
        total: filtered_cities.size
      }
    else
      render json: { cities: [], page: 1, total: 0 }
    end
  end
  
  
  
  
  
  
  
  
  
 
  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demo1
      @demo1 = Demo1.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def demo1_params
      params.require(:demo1).permit(:name,:description,:country,:state,:city,:status)
    end

end
