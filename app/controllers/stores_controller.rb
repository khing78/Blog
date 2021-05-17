class StoresController < ApplicationController
    def index
        # byebug
        
        if params[:read]
            
            @stores = Store.joins(:article).where(:article => { :read => true })
        else
            
            @stores = Store.all
        end
    end

    def show
        @store = Store.find(params[:id])
    end

    def new
        @store = Store.new
        @articles = Article.all
    end

    def create
        @store = Store.new(store_params)
        @articles = Article.all

        if @store.save
            redirect_to @store
        else
            render :new
        end
    end

    def edit
        @store = Store.find(params[:id])
        @articles = Article.all
    end

    def update
        @store = Store.find(params[:id])
        @articles = Article.all
        if @store.update(store_params)
            redirect_to @store
        else
            render :edit
        end
    end

    private
        def store_params
            params.require(:store).permit(:name, :location, :code, :article_amount, :article_id)
        end
end
