Chef::Log.info("******Uploading logs to s3.******")
script "Run a script" do
  interpreter "bash"
  code <<-EOH
    export TZ="Asia/Seoul"
    date=$(date "+%Y-%m-%d_%H:%M:%S")
    mkdir -m 777 /tmp/run-script-demo
    instanceid=$( curl http://169.254.169.254/latest/meta-data/instance-id )
    tar -czvf /tmp/run-script-demo/runs-${date}.tar.gz /var/chef/runs
    sudo aws s3 cp /tmp/run-script-demo/runs-${date}.tar.gz s3://autospot-opsworks-bucket/$instanceid/runs-${date}.tar.gz
  EOH
end