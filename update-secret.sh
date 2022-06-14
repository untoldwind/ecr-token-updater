#!/bin/sh

kubectl delete secret $ECR_SECRET -n $NAMESPACE
kubectl create secret docker-registry $ECR_SECRET --docker-server=$AWS_ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com --docker-username=AWS --docker-password=$(aws ecr get-login-password) --namespace $NAMESPACE
