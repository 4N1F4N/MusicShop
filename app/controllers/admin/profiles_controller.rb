class Admin::ProfilesController < ApplicationController
  def all
    @profiles = Profile.all
  end
end
