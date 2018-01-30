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
    # creating the result model
    vocabulary_test = VocabularyTest.find params[:test_id].to_i
    remaining = Time.now - vocabulary_test.sent
    @test_result = TestResult.create user: current_user,
     total_time: vocabulary_test.interval, remaining: remaining

    test_result_params.each do |eng_word_id, answer|
      eng_word = EngWord.find eng_word_id.to_i
      right_answers = eng_word.rus_words.map{|rus_word| rus_word.word}
      right = right_answers.include? answer
      @test_result.test_result_line_items.build \
        eng_word: eng_word, answer: answer, right: right
    end

    # destoy useless test
    vocabulary_test.destroy

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
      @test_result = TestResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_result_params
      puts
      raise ActiveRecord::RecordNotFound \
        unless current_user.vocabulary_test_ids.include? params[:test_id].to_i
      params.fetch(:test_results, {})
    end
end
