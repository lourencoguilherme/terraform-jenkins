export region_code=us-east-1
export cluster_name=k8s-demo
export account_id=655886572405

aws eks update-kubeconfig --name k8s-demo

kubectl get nodes

kubectl get po

kubectl apply -f kubernetes/apps/faker.yml
kubectl apply -f kubernetes/apps/whois.yml
kubectl apply -f kubernetes/apps/pudim.yml

kubectl apply -f kubernetes/traefik/ingress.yml