When /^I (?:like|unlike) the post "([^"]*)" in the stream$/ do |post_text|
  like_stream_post(post_text)
end

Then /^I should see an image in the publisher$/ do
  photo_in_publisher.should be_present
end

Then /^"([^"]*)" should be post (\d+)$/ do |post_text, position|
  stream_element_numbers_content(position).should have_content(post_text)
end

When /^I toggle nsfw posts$/ do
  find(".toggle_nsfw_state", match: :first).click
end

When /^I toggle all nsfw posts$/ do
  all("a.toggle_nsfw_state").each &:click
end

Then /^I should have (\d+) nsfw posts$/ do |num_posts|
  page.should have_css(".nsfw-shield", count: num_posts.to_i)
end

Then /^the stream title should be "(.*?)"$/ do |title|
  step %(I should see "#{title}" within "#aspect_stream_header")
end

Then /^the contacts title should be "(.*?)"$/ do |title|
  step %(I should see "#{title}" within "h5.stream_title")
end
