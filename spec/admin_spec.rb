require 'spec_helper'

describe 'Admin' do

    it "should load admin root" do

      visit '/admin'
      page.should have_content('Admin World!')
  end
end
