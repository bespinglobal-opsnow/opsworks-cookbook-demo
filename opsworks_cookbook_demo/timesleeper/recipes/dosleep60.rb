Chef::Log.info("******Sleeping 60s.******")
script "Run a script" do
  interpreter "bash"
  code <<-EOH
    sleep 60
  EOH
end