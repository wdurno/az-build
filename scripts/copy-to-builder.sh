echo making build dir 
kubectl exec -it build -- mkdir /build
echo copying repo to build dir 
kubectl cp ${repo_dir} build:/build
echo copying config to home 
kubectl cp ~/az-build-config.sh build:/root 
