class Blog::Posts < Grape::API

  namespase :v1 do

    params do
      requires :id, type: Integer
      optional :email, type: String
    end

  end
end