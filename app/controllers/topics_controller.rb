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
    topic = Topic.find(params[:id])
    render json: topic
  end

  def update
    topic = Topic.find(parms[:id])
    topic.update(update_params)
    render json: topic
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy!
    render json: {}
  end

  private

  def create_params
    params.require(:topic).permit(:title, :body, :speaker_id)
  end

  def update_params
    params.require(:topic).permit(:title, :body)
  end
end