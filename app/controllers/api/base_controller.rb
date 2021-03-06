class Api::BaseController < ApplicationController

  before_action :authenticate_api_key

  protect_from_forgery with: :null_session

  private

  def authenticate_api_key
    head :unauthorized unless ENV['EAT_FREE_CLIENT_KEY'] == request.headers['HTTP_CLIENT_KEY']
  end


end
