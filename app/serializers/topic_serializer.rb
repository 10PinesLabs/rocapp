class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :speaker_id
end
