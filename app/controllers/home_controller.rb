class HomeController < ApplicationController
  before_action :set_animes, :set_mangas, :set_tags, only: [:index]
  def index
  end

  private

  def set_animes
    @animes = Anime.all
  end

  def set_mangas
    @mangas = Manga.all
  end

  def set_tags
    @tags = Tag.all
  end
end
