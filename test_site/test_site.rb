class TestSite
  def home
    TestHomePage.new
  end

  def no_title
    TestNoTitle.new
  end

  def dynamic_page
    TestDynamicPage.new
  end

  def page_with_people
    TestPageWithPeople.new
  end

  def page_with_message
    TestPageWithMessage.new
  end

  def section_experiments
    TestSectionExperiments.new
  end
end

