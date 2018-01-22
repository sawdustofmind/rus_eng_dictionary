class TestResultsController < ApplicationController
  before_action :set_test_result, only: [:show, :edit, :update, :destroy]

  # GET /test_results
  # GET /test_results.json
  def index
    @test_results = TestResult.all
  end

  # GET /test_results/1
  # GET /test_results/1.json
  def show
  end

  # GET /test_results/new
  def new
    @test_result = TestResult.new
  end

  # GET /test_results/1/edit
  def edit
  end

  # POST /test_results
  # POST /test_results.json
  def create
    @test_result = TestResult.new(user: current_user)
    results_keys = params.keys.select{|key| key =~ /^\d+$/}
    results_keys.each do |result_key|
      result = params[result_key]
      eng_word = EngWord.find_by word: result["eng_word"]["word"],
                                 part_of_speech: result["eng_word"]["part_of_speech"]
      answer = result['rus_word']
      right_options = eng_word.rus_words.map{|elem| elem.word}
      right = right_options.include? answer
      @test_result.test_result_line_items.build eng_word: eng_word, answer: answer, right: right
    end

    respond_to do |format|
      if @test_result.save
        format.html { redirect_to @test_result, notice: 'Test result was successfully created.' }
        format.json { render :show, status: :created, location: @test_result }
      else
        format.html { render :new }
        format.json { render json: @test_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_results/1
  # PATCH/PUT /test_results/1.json
  def update
    respond_to do |format|
      if @test_result.update(test_result_params)
        format.html { redirect_to @test_result, notice: 'Test result was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_result }
      else
        format.html { render :edit }
        format.json { render json: @test_result.errors, status: :unprocessable_entity }
      end
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
      @test_result = TestResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_result_params
      params.fetch(:test_result, {})
    end
end
