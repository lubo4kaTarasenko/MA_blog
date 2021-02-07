class Blog::API < Grape::API
  format :json
  prefix :api
  mount Blog::Posts
end