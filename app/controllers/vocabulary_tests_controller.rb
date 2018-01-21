class VocabularyTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vocabulary_test, only: [:show, :edit, :update, :destroy]

  # GET /vocabulary_tests
  # GET /vocabulary_tests.json
  def index
    @vocabulary_tests = VocabularyTest.all
  end

  # GET /vocabulary_tests/1
  # GET /vocabulary_tests/1.json
  def show
  end

  # GET /vocabulary_tests/new
  def new
    @vocabulary_test = VocabularyTest.new
  end

  # GET /vocabulary_tests/1/edit
  def edit
  end

  # POST /vocabulary_tests
  # POST /vocabulary_tests.json
  def create
    @vocabulary_test = VocabularyTest.generate(current_user)

    respond_to do |format|
      if @vocabulary_test.save
        format.html { redirect_to @vocabulary_test, notice: 'Vocabulary test was successfully created.' }
        format.json { render :show, status: :created, location: @vocabulary_test }
      else
        format.html { render :new }
        format.json { render json: @vocabulary_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vocabulary_tests/1
  # PATCH/PUT /vocabulary_tests/1.json
  def update
    respond_to do |format|
      if @vocabulary_test.update(vocabulary_test_params)
        format.html { redirect_to @vocabulary_test, notice: 'Vocabulary test was successfully updated.' }
        format.json { render :show, status: :ok, location: @vocabulary_test }
      else
        format.html { render :edit }
        format.json { render json: @vocabulary_test.errors, status: :unprocessable_entity }
      end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_vocabulary_test
      @vocabulary_test = VocabularyTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vocabulary_test_params
      params.fetch(:vocabulary_test, {})
    end
end
