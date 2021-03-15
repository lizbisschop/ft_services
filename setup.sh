#colors
# red='\033[0;31m'

minikube start --vm-driver=virtualbox --addons metallb --addons dashboard
minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server

# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./srcs/metallb/metallb_conf.yaml
eval $(minikube docker-env)

echo "BUILDING IMAGES"
docker build -t nginx ./srcs/nginx
docker build -t mysql ./srcs/mysql
docker build -t wordpress ./srcs/wordpress
docker build -t phpmyadmin ./srcs/phpmyadmin

echo "CREATE DEPLOYMENT"
# kubectl apply -k srcs/
kubectl apply -f ./srcs/secret.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

kubectl get all