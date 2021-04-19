#colors
# red='\033[0;31m'

minikube start --vm-driver=virtualbox --disk-size=5GB
minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server

minikube dashboard &

sleep 3
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./srcs/metallb/metallb_conf.yaml
eval $(minikube docker-env)

echo "BUILDING SECRETS"
kubectl apply -f ./srcs/secret.yaml

echo "BUILDING IMAGES"
docker build -t nginx ./srcs/nginx
docker build -t mysql ./srcs/mysql
docker build -t phpmyadmin ./srcs/phpmyadmin
docker build -t wordpress ./srcs/wordpress
docker build -t influxdb ./srcs/influxdb
docker build -t telegraf ./srcs/telegraf
docker build -t grafana ./srcs/grafana

echo "CREATE DEPLOYMENT"

kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/influxdb/influxdb.yaml
kubectl apply -f ./srcs/telegraf/telegraf.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml

kubectl get all

#	kubectl exec deploy/nginx -- pkill nginx
#	kubectl exec --stdin --tty [podname] -- /bin/sh
#   minikube ssh