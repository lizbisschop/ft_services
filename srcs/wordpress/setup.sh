php-fpm7
cd /www
​
APISERVER=https://kubernetes.default.svc
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount
TOKEN=$(cat ${SERVICEACCOUNT}/token)
CACERT=${SERVICEACCOUNT}/ca.crt
URL=$(curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/default/services/wordpress/ 2>/dev/null | jq -r '.status | .loadBalancer | .ingress | .[] | .ip')
​
while :
do
    mysqladmin -h mysql ping
    if [ $? == 0 ]
    then
        break
    fi
    sleep 10
done
​
wp core install --title=Wordpress --admin_user=lbisscho --admin_password=password --admin_email=ivan-tol@student.codam.nl --skip-email --url=192.168.99.210:5050
​
wp user create ingmar ikole@student.codam.nl --user_pass=fluffclub 
wp user create mark mpeerdem@student.codam.nl --user_pass=vla 
wp user create boris bpeeters@student.codam.nl --user_pass=vela
​
nginx
​
while true; do
	sleep 10s
	ps | grep nginx | grep master
	if [ $? == 1 ]; then break
	fi
	ps | grep php-fpm | grep fpm
	if [ $? == 1 ]; then break
	fi
done