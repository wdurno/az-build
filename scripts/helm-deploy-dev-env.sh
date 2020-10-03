SERVER=$(cat ${repo_dir}/secret/acr/server)

helm upgrade dev-env ${repo_dir}/helm/dev-env/ --install --set image=$SERVER/dev-env:v1.0.0
