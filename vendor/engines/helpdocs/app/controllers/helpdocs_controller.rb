class HelpdocsController < ApplicationController

  before_filter :find_all_helpdocs
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @helpdoc in the line below:
    present(@page)
  end

  def show
    @helpdoc = Helpdoc.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @helpdoc in the line below:
    present(@page)
  end

protected

  def find_all_helpdocs
    @helpdocs = Helpdoc.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/helpdocs")
  end

end
