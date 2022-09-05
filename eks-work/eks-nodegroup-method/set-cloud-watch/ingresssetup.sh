SAMPLE_TRAFFIC_NAMESPACE=nginx-sample-traffic
EXTERNAL_IP=kubectl describe service/nginx-ingress-1662038954-controller -n eksnodegroup-cloudwatch | grep -E -o [a-zA-Z0-9-]*.us-east-1.elb.amazonaws.com

curl https://cloudwatch-agent-k8s-yamls.s3.amazonaws.com/quick-start/nginx-traffic-sample.yaml | \
sed "s/{{external_ip}}/$EXTERNAL_IP/g" | \
sed "s/{{namespace}}/$SAMPLE_TRAFFIC_NAMESPACE/g" | \
kubectl apply -f - 