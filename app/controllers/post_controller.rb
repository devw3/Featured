class PostController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def search
    @posts = Post.search(params[:title_search])

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update("search_results",
          partial: "post/search_results",
          locals: { posts: @posts })
        ]
      end
    end

    # https://blog.corsego.com/hotwire-turbo-streams-autocomplete-search
  end
end
