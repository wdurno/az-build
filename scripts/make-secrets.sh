if [ -z ${repo_dir} ]
then
  echo ERROR! repo_dir not set! Run from build.sh
  exit 1
fi

## .ssh 
kubectl create secret generic ssh-key --from-file=ssh-privatekey=~/.ssh/id_rsa --from-file=ssh-publickey=~/.ssh/id_rsa.pub
## docker registry 
kubectl create secret generic acr --from-file=${repo_dir}/secret/arc/server --from-file=${repo_dir}/secret/acr/token

