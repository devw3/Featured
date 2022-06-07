class PostController < ApplicationController
  def index
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
  end
end
