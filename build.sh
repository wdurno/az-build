## color stdout 
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e ${GREEN}setting repo dir...${NC}
export repo_dir=$PWD

echo -e ${GREEN}configuring build...${NC}
. ~/az-build-config.sh

echo -e ${GREEN}getting infrastructure...${NC}
cd ${repo_dir}/terraform
terraform init
. terraform-apply.sh

if [ $? != 0 ]; then
  echo -e ${RED}terraform apply failed!${NC}
  exit 1
fi

cd ${repo_dir} 

echo -e ${GREEN}getting acr access credentials...${NC}
. ${repo_dir}/secret/acr/get_acr_access_credentials.sh 

if [ $? != 0 ]; then
  echo -e ${RED}acr login failed!${NC}
  exit 1
fi

echo -e ${GREEN}getting .kube config...${NC}
. ${repo_dir}/scripts/get-kubeconfig-azure.sh 

echo -e ${GREEN}deploying build env...${NC} 
. ${repo_dir}/scripts/helm-deploy-build.sh 

echo -e ${GREEN}waiting for builder to be deployed...${NC} 
python ${repo_dir}/scripts/wait_for_build.py 
if [ $? != 0 ]; then
  echo -e ${RED}failed to deploy build!${NC}
  exit 1
fi

echo -e ${GREEN}configuring build env...${NC}
. ${repo_dir}/scripts/copy-to-builder.sh 

echo -e ${GREEN}buidling...${NC} 
kubectl exec -it build -- /bin/sh /build/az-build/scripts/build-dev-env.sh 

if [ $? != 0 ]; then 
  echo -e ${RED}dev-env build failed!${NC} 
  exit 1
fi 

echo -e ${GREEN}tearing-down build env...${NC} 
. ${repo_dir}/scripts/helm-tear-down-build.sh 

echo -e ${GREEN}deploying dev env...${NC}
. ${repo_dir}/scripts/helm-deploy-dev-env.sh 
