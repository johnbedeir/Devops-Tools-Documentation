# Variables
RELEASE_NAME=jenkins
PORT=8010

echo "--------------------Starting Minikube--------------------"
minikube start

echo "--------------------Adding Jenkins Helm Repo--------------------"
helm repo add jenkins https://charts.jenkins.io

echo "--------------------Update Helm Repo--------------------"
helm repo update

echo "--------------------Deploy Jenkins--------------------"
helm install ${RELEASE_NAME}  jenkins/jenkins

echo "--------------------Upgrade Jenkins--------------------"
helm upgrade ${RELEASE_NAME}  jenkins/jenkins

echo "--------------------Wait for the Pods to Start--------------------"
sleep 60s

# Forward Jenkins default port from 8080 to the PORT mentioned in variables
echo "--------------------Port Forward--------------------"
nohup kubectl --namespace default port-forward svc/${RELEASE_NAME} ${PORT}:8080 &

echo "--------------------Reveal Jenkins Password--------------------"
kubectl exec --namespace default -it svc/${RELEASE_NAME} -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo
