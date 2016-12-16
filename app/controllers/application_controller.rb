class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :history, only: [:create, :update, :destroy]

private

  def history
    SongsManager.git_commit
  end
end
