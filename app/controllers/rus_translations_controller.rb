class RusTranslationsController < ApplicationController
  before_action :set_rus_translation, only: [:show, :edit, :update, :destroy]

  # GET /rus_translations
  # GET /rus_translations.json
  def index
    @rus_translations = RusTranslation.all
  end

  # GET /rus_translations/1
  # GET /rus_translations/1.json
  def show
  end

  # GET /rus_translations/new
  def new
    @rus_translation = RusTranslation.new
  end

  # GET /rus_translations/1/edit
  def edit
  end

  # POST /rus_translations
  # POST /rus_translations.json
  def create
    @rus_translation = RusTranslation.new(rus_translation_params)

    respond_to do |format|
      if @rus_translation.save
        format.html { redirect_to @rus_translation, notice: 'Rus translation was successfully created.' }
        format.json { render :show, status: :created, location: @rus_translation }
      else
        format.html { render :new }
        format.json { render json: @rus_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rus_translations/1
  # PATCH/PUT /rus_translations/1.json
  def update
    respond_to do |format|
      if @rus_translation.update(rus_translation_params)
        format.html { redirect_to @rus_translation, notice: 'Rus translation was successfully updated.' }
        format.json { render :show, status: :ok, location: @rus_translation }
      else
        format.html { render :edit }
        format.json { render json: @rus_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rus_translations/1
  # DELETE /rus_translations/1.json
  def destroy
    @rus_translation.destroy
    respond_to do |format|
      format.html { redirect_to rus_translations_url, notice: 'Rus translation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rus_translation
      @rus_translation = RusTranslation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rus_translation_params
      params.require(:rus_translation).permit(:eng_word_id, :rus_word_id)
    end
end
