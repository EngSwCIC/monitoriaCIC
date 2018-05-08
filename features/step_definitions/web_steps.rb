require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Dado /^(?:|que eu )estou na (.+)$/ do |page_name|
  visit path_to(page_name)
end

Quando /^(?:|eu )clicar em "([^"]*)"$/ do |button|
  click_button(button)
end

Quando /^(?:|eu )preencher os seguintes campos:$/ do |table|
  table.rows_hash.each {|field, value| fill_in field, :with => value }
end

Então /^(?:|eu )devo estar na (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Então /^(?:|eu )devo ver "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end