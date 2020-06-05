Chef::Log.info("******Uploading logs to s3.******")
script "Run a script" do
  interpreter "bash"
  code <<-EOH
    mkdir -m 777 /tmp/run-script-demo
    DATE=date "+%Y-%m-%d_%H:%M:%S"
    touch /tmp/run-script-demo/helloworld-${DATE}.txt
    echo "Hello, World!" > /tmp/run-script-demo/helloworld-${DATE}.txt
    sudo aws s3 cp /tmp/run-script-demo/helloworld-${DATE}.txt s3://autospot-opsworks-bucket/helloworld-${DATE}.txt
    sleep 600
  EOH
end