json.user_id(@like.user_id)
json.partial!("spree/api/products/product", product: @like.product)
