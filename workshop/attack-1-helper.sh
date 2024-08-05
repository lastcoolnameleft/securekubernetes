#! /bin/sh

### ISSUE:  What is the equivalent of this?  LB with a Public IP?  It appears to be a way to get the Public IP of the first node in the cluster
the_ip=`kubectl get svc -n dev app -o json | jq -r '.status.loadBalancer.ingress[0].ip'`

echo "${the_ip}" | grep '^[0-9][0-9.]*[0-9]$' >> /dev/null
if [ $? -ne 0 ]; then
	echo "Unable to determine cluster NodeIP. Please ask for help."
	exit 1
fi

cat <<EOF
Gr8 n3ws, Ha><0r,

You've got shellz!

0ur syst3m p0pped anoth3r box 4 joo. t3h fundz hav b33n deduct3d fr0m ur accoun7.

Ur n3w comput3r kan B @ccess3d @ http://${the_ip}:8080/webshell us1ng Ur r3gurlar cr3ds. h@ve fUn!

4eva ur pal,
Natoshi Sakamoto
EOF
