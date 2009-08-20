class HomeController < ApplicationController
  def index
    @events = Event.recent
  end

  def changes
    @versions = Version.paginate(:page => params[:page], :order => 'created_at desc', :per_page => 20)
    respond_to do |format|
      format.html # changes.html.erb
      format.atom # changes.atom.builder
    end
  end
end
