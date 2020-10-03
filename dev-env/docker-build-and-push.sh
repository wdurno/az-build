IMAGE_NAME=${SERVER}/builder:v1.0.0
docker build . -t $IMAGE_NAME --rm=false 
docker push $IMAGE_NAME
