site :opscode

metadata

cookbook "apt"

%w[monit].each do |book|
  cookbook book,     git: "git://github.com/dn/chef-#{book}.git"
end
