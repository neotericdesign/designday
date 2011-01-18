User.find(:all).each do |user|
  if user.plugins.find_by_name('help_docs').nil?
    user.plugins.create(:name => 'help_docs',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Page.create(
  :title => 'Help Docs',
  :link_url => '/help_docs',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/help_docs(\/|\/.+?|)$'
)
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
