class VocabularyTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vocabulary_test, only: [:show, :destroy]

  # GET /vocabulary_tests
  # GET /vocabulary_tests.json
  def index
    @vocabulary_tests = current_user.vocabulary_tests
  end

  # GET /vocabulary_tests/1
  # GET /vocabulary_tests/1.json
  def show
  end

  # POST /vocabulary_tests
  # POST /vocabulary_tests.json
  def create
    @vocabulary_test = VocabularyTest.generate(current_user)
    respond_to do |format|
        format.html { redirect_to @vocabulary_test, notice: 'Vocabulary test was successfully created.' }
        format.json { render :show, status: :created, location: @vocabulary_test }
    end
  end

  # DELETE /vocabulary_tests/1
  # DELETE /vocabulary_tests/1.json
  def destroy
    @vocabulary_test.destroy
    respond_to do |format|
      format.html { redirect_to vocabulary_tests_url, notice: 'Vocabulary test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_vocabulary_test
      raise ActiveRecord::RecordNotFound \
        unless current_user.vocabulary_test_ids.include? params[:id].to_i
      @vocabulary_test = VocabularyTest.find(params[:id])
    end
end
