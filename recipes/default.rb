# Take each redirection in the array, and build a site for it from the template
# NOTE: We expect you to install your own certificates before this (and just give path here)
node['nginx-redirect'][:redirections].each do |redirection|
  public_cert = redirection[:ssl_certificate]
  private_key = redirection[:ssl_key]
  template "/etc/nginx/sites-available/#{redirection[:host]}" do
    source 'redirection.nxsite.erb'
    owner 'root'
    group 'root'
    mode 0644
    variables({site: redirection[:host],
               new_site: redirection[:to],
               public_cert: public_cert,
               private_key: private_key})
    notifies :restart, resources(:service => 'nginx')
  end

  execute "nxensite #{redirection[:host]}" do
    command "/usr/sbin/nxensite #{redirection[:host]}"
    notifies :restart, resources(:service => "nginx")
    only_if { File.exists?("#{node[:nginx][:dir]}/sites-available/#{redirection[:host]}") }
    not_if { File.symlink?("#{node[:nginx][:dir]}/sites-enabled/#{redirection[:host]}") }
  end

end
