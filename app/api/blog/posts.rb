class Blog::Posts < Grape::API
  namespace :v1 do
    get do
      Post.published.includes(:images).map do |post|
        post.attributes.merge(
          images: post.images.map(&:url)
        )
      end
    end

    get ':user_id/:post_id' do
      Post.find_by(id: params[:post_id], user_id: params[:user_id])
    end

    post do
      Post.create(params)
    end

    post ':user_id/:post_id/image' do
      post = Post.find_by(id: params[:post_id], user_id: params[:user_id])
      post.images.create(url: params[:url])
    end

    params do
      requires :post_id, type: Integer
      requires :user_id, type: Integer
    end

    put ':user_id/:post_id' do
      post = Post.find_by(id: params[:post_id], user_id: params[:user_id])
      post.update(
        body: params[:body],
        title: params[:title],
        published_at: (params[:publish] ? Date.today : nil)
      )
    end

    delete ':user_id/:post_id' do
      Post.find_by(id: params[:post_id], user_id: params[:user_id]).destroy
    end
  end
end
