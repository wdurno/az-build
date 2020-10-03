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

echo -e ${GREEN}deploying secrets...${NC}
. ${repo_dir}/scripts/deploy-secrets.sh 

echo -e ${GREEN}deploying dev env...${NC}
. ${repo_dir}/scripts/helm-deploy-dev-env.sh 
