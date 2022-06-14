class FeaturedContentController < ApplicationController
  def index
  end

  def search
    @posts = Post.search(params[:title_search])
    @div_id = params[:div_id]
    @content_id = getContent(@div_id)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update(@div_id,
          partial: "featured_content/search_results",
          locals: { posts: @posts })
        ]
      end
    end

    # https://blog.corsego.com/hotwire-turbo-streams-autocomplete-search
  end

  def getContent(search_results)
    content = search_results
    content.gsub!('results', 'content')

    return content.to_s
  end

  def show
  end
end
