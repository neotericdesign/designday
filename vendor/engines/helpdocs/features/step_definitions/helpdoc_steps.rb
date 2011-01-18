Given /^I have no helpdocs$/ do
  Helpdoc.delete_all
end

Given /^I (only )?have helpdocs titled "?([^"]*)"?$/ do |only, titles|
  Helpdoc.delete_all if only
  titles.split(', ').each do |title|
    Helpdoc.create(:title => title)
  end
end

Then /^I should have ([0-9]+) helpdocs?$/ do |count|
  Helpdoc.count.should == count.to_i
end
