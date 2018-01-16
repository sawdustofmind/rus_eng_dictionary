class RusTranslationsController < ApplicationController
  before_action :set_rus_translation, only: [:destroy]

  # GET /rus_translations
  # GET /rus_translations.json
  def index
    @rus_translations = RusTranslation.all
  end

  # GET /rus_translations/new
  def new
    @rus_translation = RusTranslation.new
  end

  # POST /rus_translations
  # POST /rus_translations.json
  def create
    # parsing parameters  
    part_of_speech = rus_translation_params[:part_of_speech]
    rus_word_value = rus_translation_params[:rus_word]
    eng_word_value = rus_translation_params[:eng_word]

    # getting / creating words entries
    eng_word = EngWord.find_by(word: eng_word_value, part_of_speech: part_of_speech) \
      || EngWord.create(word: eng_word_value, part_of_speech: part_of_speech)
    rus_word = RusWord.find_by(word: rus_word_value) \
      || RusWord.create(word: rus_word_value)

    # creating rus_translation entry
    @rus_translation = RusTranslation.new
    @rus_translation.eng_word = eng_word
    @rus_translation.rus_word = rus_word

    # render
    respond_to do |format|
      if @rus_translation.save
        format.html { redirect_to rus_translations_path, notice: 'Rus translation was successfully created.' }
        format.json { render :show, status: :created, location: @rus_translation }
      else
        format.html { render :new }
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
      params.require(:rus_translation).permit(:part_of_speech, :eng_word, :rus_word)
    end
end
