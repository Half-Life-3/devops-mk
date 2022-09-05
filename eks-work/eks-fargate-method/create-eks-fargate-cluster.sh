eksctl create cluster -f ConfigClusterFargate.yaml

aws eks update-kubeconfig --name eks-fargate
eksctl utils associate-iam-oidc-provider --region us-east-1 --cluster eks-fargate --approve

curl -o iam_policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.2.0/docs/install/iam_policy.json
curl -o iam_policy_alb.json https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/master/docs/examples/rbac-role.yaml
curl -o iam_policy_alb.json https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/master/docs/examples/rbac-role.json
curl -o iam_policy_alb.yaml https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/master/docs/examples/rbac-role.yaml

eksctl create iamserviceaccount --cluster eks-fargate --namespace kube-system --name aws-load-balancer-controller --attach-policy-arn arn:aws:iam::047032559530:policy/AWSLoadBalancerControllerIAMPolicy --override-existing-serviceaccounts --approve
kubectl apply -k github.com/aws/eks-charts/stable/aws-load-balancer-controller/crds?ref=master
helm repo add eks https://aws.github.io/eks-charts

eksVPC=$(aws eks describe-cluster --name eks-fargate | grep -E -o vpc-+[a-zA-Z0-9]*)
#eksVPC=$(aws ec2 describe-vpcs --filters Name=tag:Name,Values=eksctl-myeks-cluster-cluster/VPC --query "Vpcs[].VpcId" --output text)
echo $eksVPC
helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \
     --set clusterName=eks-fargate \
     --set serviceAccount.create=false \
     --set region=us-east-1 \
     --set vpcId=$eksVPC \
     --set serviceAccount.name=aws-load-balancer-controller \
     -n kube-system

kubectl -n kube-system rollout status deployment aws-load-balancer-controller