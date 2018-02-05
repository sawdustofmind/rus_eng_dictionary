class TestResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_result, only: [:show, :destroy]

  # GET /test_results
  # GET /test_results.json
  def index
    @test_results = current_user.test_results
  end

  # GET /test_results/1
  # GET /test_results/1.json
  def show
  end

  # POST /test_results
  # POST /test_results.json
  def create
    @test_result = TestResult.complete_test \
      test_result_params, current_user
    respond_to do |format|
      format.html { redirect_to @test_result, notice: 'Test result was successfully created.' }
      format.json { render :show, status: :created, location: @test_result }
    end
  end

  # DELETE /test_results/1
  # DELETE /test_results/1.json
  def destroy
    @test_result.destroy
    respond_to do |format|
      format.html { redirect_to test_results_url, notice: 'Test result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_result
      raise ActiveRecord::RecordNotFound \
        unless current_user.test_result_ids.include? params[:id].to_i
      @test_result = TestResult.find params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_result_params
        stronge_params = params.require(:test_result) \
          .permit(:vocabulary_test_id, entries: {})
        raise ActiveRecord::RecordNotFound \
          unless current_user.vocabulary_test_ids.include? \
            stronge_params[:vocabulary_test_id].to_i
        stronge_params
    end
end
