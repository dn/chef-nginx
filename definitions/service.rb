define :nginx_unicorn do
  app_config = search(:apps, "id:#{node['app']['id']}").first

  template "/etc/nginx/nginx.conf" do
    source    "service.nginx.conf.erb"
    variables ({:name     => params[:name],
                :htpasswd => app_config[:htpasswd]})
  end
  
  if app_config[:htpasswd]
    template "/etc/nginx/htpasswd" do
      source  "htpasswd.erb"
      variables ({:htpasswd => app_config[:htpasswd]})
    end
  end
  
  monit_app "nginx" do
  end
end

