require 'spec_helper'

describe 'Blog' do

    it "should load blog root" do

      visit '/blog'
      page.should have_content('Blog World!')
  end
end



