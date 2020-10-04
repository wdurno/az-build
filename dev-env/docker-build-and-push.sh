IMAGE_NAME=${SERVER}/dev-env:v1.2.0
docker build . -t $IMAGE_NAME --rm=false 
docker push $IMAGE_NAME
