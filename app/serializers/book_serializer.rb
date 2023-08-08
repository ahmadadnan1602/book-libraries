class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :available, :user_id
end
