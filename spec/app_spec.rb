require 'spec_helper'

describe 'App' do

	it "should load app root" do
    visit '/'
		page.should have_content('Hello World!')
	end
end
