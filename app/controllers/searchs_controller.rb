class SearchsController < ApplicationController 

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

    post = Post
    .search(q, operator: "and", where: conditional, order: order)

    array_search = []


    post.each do |n|
      array_search << {
        title: n.title,      
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
