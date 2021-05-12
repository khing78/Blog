class ArticlesController < ApplicationController
  before_action :check_id_allow, only: :show 

  def index
    @data = params[:range]
    if @data != nil
      @articles = Article.limit(@data)
    else
      @articles = Article.limit(3)
    end
  end

  def show
    @article
    @read = @article.read
    if @read == false
      @read = "unread"
    else
      @read = "readed"

    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else 
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :read)
    end

    def check_id_allow
      begin
        @article = Article.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render file: "#{Rails.root}/public/404.html", layout: false
      end
    end
end