class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
  
  def new 
    @article = Article.new
  end

  def create
    #creates a new model object and stores it in an instance variable
    @article = Article.new(article_params)

    #once its done, we're going to try and save it. If it successfully does so without any errors, we going to redirect back to articles/:id. 
    #rails is smart enough that if you pass a model object to redirect_to, it's going to call the apprproiate path helper to convert the object to a path. 
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
    # @article = Article.new(article_params)
    @article = Article.find(params[:id])

    #if that article, or ref to that article, is to be updated,
    # if @article.update
    #   redirect_to @article
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

  #concept of strong params. returns a hash with the values :title and :body from params[:article]. this is how we whitelist non-scalar attributes in the params hash. 
  def article_params
    params.require(:article).permit(:title, :body)
  end

end