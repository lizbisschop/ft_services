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


kubectl apply -f ./srcs/secret.yaml

echo "BUILDING IMAGES"
docker build -t nginx ./srcs/nginx
docker build -t mysql ./srcs/mysql2
docker build -t phpmyadmin ./srcs/phpmyadmin
docker build -t wordpress ./srcs/wordpress

echo "CREATE DEPLOYMENT"
# kubectl apply -k srcs/

kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/mysql2/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
# kubectl apply -f ./srcs/influxdb/influxdb.yaml
# kubectl apply -f ./srcs/telegraf/telegraf.yaml
# kubectl apply -f ./srcs/grafana/grafana.yaml

kubectl get all

#	kubectl exec deploy/nginx -- pkill nginx
#	kubectl exec --stdin --tty [podname] -- /bin/sh
#   minikube ssh