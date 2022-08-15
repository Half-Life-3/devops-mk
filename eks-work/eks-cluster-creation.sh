eksctl create cluster --name myeks-cluster --region=us-east-1 --zones=us-east-1a,us-east-1b,us-east-1c,us-east-1d --fargate
eksctl create fargateprofile --cluster myeks-cluster --region us-east-1 --name capstone-cluster --namespace kube-system
eksctl utils associate-iam-oidc-provider --region us-east-1 --cluster myeks-cluster --approve
eksctl create iamserviceaccount \
  --cluster=myeks-cluster \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name "AmazonEKSLoadBalancerControllerRole" \
  --attach-policy-arn=arn:aws:iam::047032559530:policy/AWSLoadBalancerControllerIAMPolicy \
  --override-existing-serviceaccounts \
  --approve
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=myeks-cluster \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=us-east-1 \
  --set vpcId=vpc-0e14db896e7c6f4ba \
  --set image.repository=602401143452.dkr.ecr.us-east-1.amazonaws.com/amazon/aws-load-balancer-controller