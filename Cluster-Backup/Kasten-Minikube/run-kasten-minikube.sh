#!/bin/bash
NAMESPACE=kasten-io
# check_jq=snap list jq | grep latest
NS_CHECK=$"kubectl get ns kasten-io -o jsonpath='{.status.phase}' | grep Active"
#NS_CHECK=$"kubectl get ns kasten-io -o json | jq .status.phase -r"
#NS_CHECK=$"kubectl describe ns kasten-io | sed '4!d' | awk '{print $2}'"

if [ "$NS_CHECK" == "Active" ]; then

    echo "kasten-io namespace already exist, Do you want to Delete namespace? y/n"
    read n
    if [[ $n = y ]]; then

        #Delete deployments
        echo "--------------------Delete Deployment--------------------"
        kubectl delete deploy --all -n $NAMESPACE || true

        #Delete services
        echo "--------------------Delete Services--------------------"
        kubectl delete service --all -n $NAMESPACE || true

        #Delete configmap
        echo "--------------------Delete Configmap--------------------"
        kubectl delete configmap --all -n $NAMESPACE || true

        #Delete namespace
        echo "--------------------Delete Namespace--------------------"
        timeout 5s kubectl delete namespace $NAMESPACE || true

        #--------------------------------------------------------------
        # Enable the following 3 commands only if you cannot delete the namespace and the command 
        # "kubectl delete namespace kasten-io" stuck 
        #--------------------------------------------------------------

        #Get namespace json file 
        echo "--------------------Get NS Json--------------------"
        kubectl get namespace $NAMESPACE -o json > ns.json

        #Remove kubernetes from namespace metadata to be able to delete namespace
        echo "--------------------Edit NS Json--------------------"
        sed -i '/"kubernetes"/d' ./ns.json

        # #replace the new json with the old one 
        echo "--------------------Replace NS Json--------------------"
        kubectl replace --raw "/api/v1/namespaces/$NAMESPACE/finalize" -f ./ns.json

        #--------------------------------------------------------------
        #--------------------------------------------------------------
        #--------------------------------------------------------------

    else
        exit
    fi

elif [ "$NS_CHECK" != "Active" ]; then

    echo "kasten-io namespace does not exist, Do you want to Create namespace? y/n"
    read n
    if [[ $n = y ]]; then

        #Create namespace
        echo "--------------------Create Namespace--------------------"
        kubectl create namespace $NAMESPACE

        #Add Helm Repo
        echo "--------------------Add Kasten Helm Repo--------------------"
        helm repo add kasten https://charts.kasten.io/

        #Install kasten with helm and port forward
        echo "--------------------Install Kasten--------------------"
        helm install k10 kasten/k10 --namespace=$NAMESPACE 

        #Wait for the pod to start
        echo "--------------------Wait 1m Pod is Starting--------------------"
        sleep 1m

        #Update helm repo 
        echo "--------------------Update Helm Repo & Upgrade K10--------------------"
        helm repo update && \
            helm get values k10 --output yaml --namespace=kasten-io > k10_val.yaml && \
            helm upgrade k10 kasten/k10 --namespace=kasten-io -f k10_val.yaml

        #Port forward
        echo "--------------------Port Forward--------------------"
        kubectl --namespace kasten-io port-forward service/gateway 8080:8000

        #open kasten on brwoser
        xdg-open http://127.0.0.1:8080/k10/

    else
        exit
    fi

fi