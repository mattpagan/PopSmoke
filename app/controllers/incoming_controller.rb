class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
  @record = Record.new
    
  if @record.save
    ModelMailer.new_record_notification(@record).deliver
    redirect_to @record
  end
end

