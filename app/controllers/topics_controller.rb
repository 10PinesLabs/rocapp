class TopicsController < ApplicationController

  def create
    topic = Topic.create!(create_params)
    render json: topic
  end

  def index
    topics = Topic.all
    render json: topics
  end

  def show
    topic = Topic.where(id: params[:id])
    render json: topic
  end

  def update
    topic = Topic.where(id: parms[:id])
    topic.update(parms[:id], update_params)
    render json: topic
  end

  private

  def create_params
    params.require(:topic).permit(:title, :body, :speaker_id)
  end

  def update_params
    params.require(:topic).permit(:title, :body)
  end

  protected
  def checkToken
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(token)
    end
  end
end