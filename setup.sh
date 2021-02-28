#colors
red='\033[0;31m'

eval $(minikube docker-env)


echo "BUILDING IMAGES"
docker build -t nginx ./srcs/nginx

echo "RUNNING DOCKER"
docker run -it -p80:80 -p443:443 nginx ./srcs/nginx