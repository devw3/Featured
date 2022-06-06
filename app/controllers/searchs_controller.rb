class SearchsController < ApplicationController
  def index
    @page_title = ' - Featured'
    #page_info("Busca")
    @msg = ''
  end
  
  def search
    @msg = ''

    q = params[:q]
    order = {}
    where = {}
    order[:date_publish] = 'desc'

    post = Post.search(q)    

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

    #page_info("Busca")
  end
end

# Product.search("apples", where: {in_stock: true}, limit: 10, offset: 50)

# products = Product.search("apples")
# products.each do |product|
#   puts product.name
# end