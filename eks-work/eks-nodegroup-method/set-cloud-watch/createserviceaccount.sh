eksctl utils associate-iam-oidc-provider --region=us-east-1 --cluster=myeks-nodegroup
eksctl create iamserviceaccount \
           --name cwagent-prometheus \
           --namespace amazon-cloudwatch \
           --cluster myeks-nodegroup \
           --attach-policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy \
           --override-existing-serviceaccounts \
           --approve