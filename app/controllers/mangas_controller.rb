class MangasController < ApplicationController
  before_action :set_manga, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, :set_authors, only: [:show, :new, :edit, :create, :update]
  before_action :set_params_tags, :set_author, only: [:update, :create]

  # GET /mangas
  # GET /mangas.json
  def index
    @mangas = Manga.order :updated_at=>:desc
  end

  # GET /mangas/1
  # GET /mangas/1.json
  def show
  end

  # GET /mangas/new
  def new
    @manga = Manga.new
  end

  # GET /mangas/1/edit
  def edit
  end

  # POST /mangas
  # POST /mangas.json
  def create
    @manga = Manga.new(manga_params)
    @manga.tags = @params_tags
    @manga.author = @author

    respond_to do |format|
      if @manga.save
        format.html { redirect_to @manga, notice: 'Manga was successfully created.' }
        format.json { render :show, status: :created, location: @manga }
      else
        format.html { render :new }
        format.json { render json: @manga.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mangas/1
  # PATCH/PUT /mangas/1.json
  def update
    @manga.tags = @params_tags
    @manga.author = @author

    respond_to do |format|
      if @manga.update(manga_params)
        format.html { redirect_to @manga, notice: 'Manga was successfully updated.' }
        format.json { render :show, status: :ok, location: @manga }
      else
        format.html { render :edit }
        format.json { render json: @manga.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mangas
  # DELETE /mangas/1.json
  def destroy
    @manga.destroy
    respond_to do |format|
      format.html { redirect_to mangas_url, notice: 'Manga was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manga
      @manga = Manga.friendly.find(params[:id])
    end

    def set_tags
      @tags = Tag.order :name
    end

    def set_params_tags
      @params_tags = []

      unless params[:tags].nil?
        params[:tags].each do |tag|
          @params_tags << Tag.find(tag)
        end
      end

      @params_tags
    end

    def set_author
      @author = if params[:author].nil?
        Author::new
      else
        Author.friendly.find(params[:author])
      end
    end

    def set_authors
      @authors = Author.all.map do |a|
        [a.name, a.id]
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manga_params
      params.require(:manga).permit(:title, :volume, :chapter, :chapter_title, :last_visited_url)
    end
end
