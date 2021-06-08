class SearchResultsController < ApplicationController
  before_action :set_search_result, only: %i[ show edit update destroy ]

  # GET /search_results or /search_results.json
  def index
    @search_results = SearchResult.all
  end

  # GET /search_results/1 or /search_results/1.json
  def show
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
