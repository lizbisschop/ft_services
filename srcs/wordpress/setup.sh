php-fpm7
cd /www
​
# APISERVER=https://kubernetes.default.svc
# SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount
# TOKEN=$(cat ${SERVICEACCOUNT}/token)
# CACERT=${SERVICEACCOUNT}/ca.crt
# URL=$(curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/default/services/wordpress/ 2>/dev/null | jq -r '.status | .loadBalancer | .ingress | .[] | .ip')
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
wp core install --title=Wordpress --admin_user=lbisscho --admin_password=password --admin_email=lbisscho@student.codam.nl --skip-email --url=192.168.99.210:5050
​
wp user create iris iboeters@student.codam.nl --user_pass=iris 
wp user create bas bnijland@student.codam.nl --user_pass=userbas 
wp user create pim pmellema@student.codam.nl --user_pass=pim
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