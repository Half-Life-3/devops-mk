aws ec2 run-instances --image-id amzn2-ami-kernel-5.10-hvm-2.0.20220912.1-x86_64-gp2 --count 1 --instance-type t2.micro --key-name ansible_ec2 --security-group-ids sg-0de017411c7d3ea17 --subnet-id subnet-08e7ce6a8234b1cd9