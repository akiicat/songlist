class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :dashboard?, :title
  after_action :history, only: [:create, :update, :destroy]

private

  def history
    SongsManager.git_commit
  end

  def title
    @title = dashboard? ? "歌單 - Dashboard" : "歌單"
  end

  def dashboard?
    params[:dashboard]
  end
  helper_method :dashboard?
end
