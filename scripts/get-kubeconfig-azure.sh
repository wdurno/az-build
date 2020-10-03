. ~/az-build-config.sh

cluster_name=build-aks

az aks get-credentials --name ${cluster_name} --resource-group ${az_build_resource_group_name} --overwrite-existing
