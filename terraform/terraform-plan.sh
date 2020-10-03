. ~/az-build-config.sh
terraform plan \
  -var="subscription_id=${az_build_subscription_id}"\
  -var="tenant_id=${az_build_tenent_id}"\
  -var="resource_group_name=${az_build_resource_group_name}"
