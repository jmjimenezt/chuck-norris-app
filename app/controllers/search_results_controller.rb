class SearchResultsController < ApplicationController
  before_action :set_search_result, only: %i[ show edit update destroy send_results ]

  # GET /search_results or /search_results.json
  def index
    @search_results = SearchResult.all
  end

  # GET /search_results/1 or /search_results/1.json
  def show
    @jokes_array = Kaminari.paginate_array(@search_result.jokes).page(params[:page]).per(6)
  end

  # GET /search_results/new
  def new
    @search_result = SearchResult.new
  end

  # GET /search_results/1/edit
  def edit
  end

  # POST /search_results or /search_results.json
  def create
    @search_result = SearchResult.new(search_result_params)
    is_random = search_result_params["keywords"].blank? # It's a random search if not keywords provided
    @search_result.random = is_random

    if (is_random) 
      options = search_result_params["categories"].blank? ? {} : { query: { category: search_result_params["categories"] } }
      jokes_result = RandomJokeService.new.call(options)
    else
      # Regular search
      options = { query: { query: search_result_params["keywords"] } }
      jokes_result = JokeSearchService.new.call(options)
    end
    
    jokes_result.each do |j|
      j["categories"] = j["categories"].join(', ') # Not happy with this. Just done to avoid creating a Category model
      joke = Joke.find_or_create_by(j)
      @search_result.jokes << joke
    end

    respond_to do |format|
      if @search_result.save
        format.html { redirect_to @search_result, notice: "Search result was successfully created." }
        format.json { render :show, status: :created, location: @search_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @search_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_results/1 or /search_results/1.json
  def update
    respond_to do |format|
      if @search_result.update(search_result_params)
        format.html { redirect_to @search_result, notice: "Search result was successfully updated." }
        format.json { render :show, status: :ok, location: @search_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @search_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_results/1 or /search_results/1.json
  def destroy
    @search_result.destroy
    respond_to do |format|
      format.html { redirect_to search_results_url, notice: "Search result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def send_results
    puts "TODO: sending search results by email to #{search_result_params["email"]}"
    redirect_to @search_result, notice: "Search results sent by email to #{search_result_params["email"]}" 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_result
      @search_result = SearchResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_result_params
      params.require(:search_result).permit(:keywords, :categories, :random, :email)
    end
end
