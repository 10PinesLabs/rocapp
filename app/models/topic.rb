class Topic < ActiveRecord::Base
  validates_presence_of :title, :body, :speaker

  belongs_to :speaker, class_name: 'User'
end
