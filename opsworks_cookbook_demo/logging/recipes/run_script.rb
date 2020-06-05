Chef::Log.info("******Uploading logs to s3.******")
script "Run a script" do
  interpreter "bash"
  code <<-EOH
    mkdir -m 777 /tmp/run-script-demo
    touch /tmp/run-script-demo/helloworld.txt
    echo "Hello, World!" > /tmp/run-script-demo/helloworld.txt
    sudo aws s3 cp /tmp/run-script-demo/helloworld.txt s3:///autospot-opsworks-bucket/helloworld.txt
  EOH
end