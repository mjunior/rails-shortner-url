class UrlSerializer < ActiveModel::Serializer
  attributes :id, :title, :original, :total_access, :short
end
