class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :toggle_draft]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  def index
    if current_user.try(:admin?)
      @articles = Article.all.order(created_at: :desc)
    else
      @articles = Article.where(draft:false).order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
        # format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_draft
    @article.toggle(:draft).save
    redirect_to articles_url,  notice: 'Article was successfully updated.'
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :draft)
    end
end
