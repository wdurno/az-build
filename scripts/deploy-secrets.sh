if [ -z ${repo_dir} ]
then
  echo ERROR! repo_dir not set! Run from build.sh
  exit 1
fi

## .ssh 
kubectl create secret generic ssh-key \
  --from-file=ssh-privatekey=${HOME}/.ssh/id_rsa \
  --from-file=ssh-publickey=${HOME}/.ssh/id_rsa.pub
## docker registry 
kubectl create secret docker-registry acr-creds \
  --docker-server=$(cat ${repo_dir}/secret/acr/server) \
  --docker-username=00000000-0000-0000-0000-000000000000 \
  --docker-password=$(cat ${repo_dir}/secret/acr/token)

