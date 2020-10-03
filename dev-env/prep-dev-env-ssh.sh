## reconfigures k8s secret volume for git

mkdir -p /root/.ssh 
cp /root/ssh/ssh-privatekey /root/.ssh/id_rsa
cp /root/ssh/ssh-publickey /root/.ssh/id_rsa.pub 
chmod ga-r /root/.ssh/id_rsa
