class HomeController < ApplicationController
  before_action :set_animes, :set_mangas, :set_tags, only: [:index]
  def index
  end

  private

  def set_animes
    @animes = Anime.order :title
  end

  def set_mangas
    @mangas = Manga.order :title
  end

  def set_tags
    @tags = Tag.order :name
  end
end
