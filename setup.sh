#colors
red='\033[0;31m'

minikube start --vm-driver=virtualbox --addons metalldb --addons dashboard

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./srcs/nginx/metalldb_conf.yml
eval $(minikube docker-env)

echo "BUILDING IMAGES"
docker build -t nginx ./srcs/nginx
docker build -t mysql ./srcs/mysql
docker build -t wordpress ./srcs/wordpress

echo "CREATE DEPLOYMENT"
kubectl create -k srcs/
kubectl create -f ./srcs/nginx/nginx.yaml
# kubectl create -f ./srcs/mysql/mysql.yml
# kubectl create -f ./srcs/wordpress/wordpress.yml

kubectl get all