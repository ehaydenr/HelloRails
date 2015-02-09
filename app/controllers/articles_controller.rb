class ArticlesController < ApplicationController
    
    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    def index
        @articles = Article.all
    end
    def create
        @article = Article.new(article_params)
        
        @article.save
        redirect_to @article
    end
    def show
        @article = Article.find(params[:id])
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        redirect_to articles_path
    end
    def list
    # register a client with YOUR_CLIENT_ID as client_id_
    client = SoundCloud.new(:client_id => '0cf77f09d09ff38c8e3a2d7ef1b21e1b')
    # get 10 hottest tracks
    tracks = client.get('/tracks', :limit => 10, :order => 'hotness')
    # print each link
    tracks.each do |track|
    puts track.permalink_url
    end
    end
    def new
    end
    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
    
end
