class Blog < App

  # configure do
  #   set :views, APP_ROOT.join('views', 'blog')
  # end

	get '/' do
    haml :'blog/index'
	end
end
