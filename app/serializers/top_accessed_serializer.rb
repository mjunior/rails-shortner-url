class TopAccessedSerializer < ActiveModel::Serializer
  attributes :title, :total_access, :short, :original
end
