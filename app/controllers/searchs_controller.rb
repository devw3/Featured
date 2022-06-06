class SearchsController < ApplicationController
  layout "application_no_google_news"

  def index
    @msg = ""

    @page_title = "Busca - Featured"   
  end

  def search
    @msg = ""

    q = params[:q]

    order = {}

    conditional = {}

    order[:date_publish] = "desc"

    conditional[:status] = true

    content_builder = ContentBuilder
    .search(q, operator: "and", where: conditional, order: order)

    posts = Post.search(q, order: order) 

    array_search = []

    albums.each do |n|
      array_search << {
        title: n.title,
        slug: n.slug,
        date_publish: n.date_publish.strftime("%d/%m/%Y"),
        type: 2
      }
    end
    

    content_builder.each do |n|
      array_search << {
        title: n.title,
        #category: n.category.slug,
        slug: n.slug,
        date_publish: n.date_publish.strftime("%d/%m/%Y"),
        type: 1
      }
    end

    @result_search_size = array_search.size

    @result_search = Kaminari.paginate_array(
      array_search, total_count: @result_search_size
    ).page(params[:page])

    @page_title = "Busca - Featured"   
  end
end
