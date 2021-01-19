# wait for 
while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done

sudo apt-get update -y

# install nodejs
sudo apt-get install nodejs

# install npm
sudo apt-get install npm

# install serve
npm install -g serve

echo "*********************intalling CodeDeploy*********************"
sudo apt-get install ruby -y
# cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ~/install
sudo ./install auto

# 这样就能保证以这个镜像为蓝本的 ec2 会直接启动 codedeploy 代理
sudo service codedeploy-agent start 
sudo service codedeploy-agent status
echo "*********************install CodeDeploy finish*********************"