class Blog::Posts < Grape::API

  namespace :v1 do

    get do
      Post.published.includes(:images)
    end

    get ':user_id/:post_id' do
      Post.find_by(id: params[:post_id], user_id: params[:user_id])
    end

    post do
      Post.create(params)
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
        published_at: (params[:publish] ? Date.today : post.published_at)
      )
    end

    delete ':user_id/:post_id' do
      Post.find_by(id: params[:post_id], user_id: params[:user_id]).destroy
    end
  end
end
