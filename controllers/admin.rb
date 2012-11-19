class Admin < App

  get '/'do
   	haml :'admin/index'
  end
end
