class Admin::DashboardController < ApplicationController
  USERNAME = ENV['ADMIN_USERNAME']
  PASSWORD = ENV['ADMIN_PASSWORD']

  http_basic_authenticate_with :name => USERNAME, :password => PASSWORD

  def show
  end
end
