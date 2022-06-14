class PostController < ApplicationController
  def index
    @div_id = ""
  end

  def show
    @post = Post.find(params[:id])
  end

  def search
    title_search = params[:title_search]
    search_results = params[:div_id]

    @posts = Post.search(title_search)

    #raise
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update(search_results,
          partial: "post/search_results",
          locals: { posts: @posts })
        ]
      end
    end

    # https://blog.corsego.com/hotwire-turbo-streams-autocomplete-search
  end
end
