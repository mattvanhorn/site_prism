class TestHomePage < SitePrism::Page
  set_url "/home.htm"
  set_url_matcher /home\.htm$/

  #individual elements
  element :welcome_header, :xpath, '//h1'
  element :welcome_message, :xpath, '//span'
  element :go_button, :xpath, '//input'
  element :link_to_search_page, :xpath, '//a'
  element :some_slow_element, :xpath, '//a[@class="slow"]'
  element :invisible_element, 'input.invisible'
  element :shy_element, 'input#will_become_visible'
  element :retiring_element, 'input#will_become_invisible'
  element :remove_container_with_element_btn, 'input#remove_container_with_element'
  element :some_text_field, 'input#fill_me_in'

  #elements groups
  elements :lots_of_links, :xpath, '//td//a'
  elements :nonexistent_elements, 'input#nonexistent'

  #elements that should not exist
  element :squirrel, 'squirrel.nutz'
  element :other_thingy, 'other.thingy'
  element :nonexistent_element, 'input#nonexistent'

  #sections
  section :people, People, '.people'
  section :container_with_element, ContainerWithElement, '#container_with_element'
  section :nonexistent_section, NoElementWithinSection, 'input#nonexistent'
  sections :nonexistent_section, NoElementWithinSection, 'input#nonexistent'

  #iframes
  iframe :my_iframe, MyIframe, '#the_iframe'

  def do_something
    # interact with elements...
    some_text_field.set 'foobar'
  end
end

