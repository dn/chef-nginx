define :nginx_unicorn do
  template "/etc/nginx/nginx.conf" do
    source    "service.nginx.conf.erb"
    variables ({:name => params[:name]})
  end
  
  template "/etc/nginx/nginx.conf" do
    source    "service.nginx.conf.erb"
    variables ({:name => params[:name]})
  end

  monit_app "nginx", :app_name => params[:name]
end
