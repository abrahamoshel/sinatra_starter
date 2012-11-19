class App < Sinatra::Base

	configure do
		#setup
		set :controllers, Dir[File.join(root,'controllers/*.rb')]
		set :public_folder, File.join(root, "assets")
		set :css_folder, File.join(public_folder, "css")
		set :js_folder, File.join(public_folder, "js")
		set :img_folder, File.join(public_folder, "img")
		set :haml, {format: :html5}

    helpers ApplicationHelper
	end

  configure :development do
    register Sinatra::Reloader
    reloader_files = Dir[APP_ROOT.join('lib/**/*.rb')] + controllers
    reloader_files.each {|file| also_reload file}
  end

  controllers.each do |file_path|
    # file_name = File.basename(file_path, ".rb")
    require file_path
    # include file_name.constantize
  end

	get '/' do
		haml :index
	end

end
