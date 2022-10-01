#!/bin/bash
NAMESPACE=kasten-io

# Check if minikube is running 
echo "Check Minikube Status"
minikube status 
echo "If Minikube is Running press (y) to proceed, if not press (n) to start Minikube"
read n
# If minikube is not running then start it first 
if [[ $n = n ]]

then

    minikube start
    
    # After starting minikube check if kasten namespace exist 
    echo "Check if kasten namespace already exist..!"
    kubectl get ns kasten-io
    
    echo "If kasten-io namespace not exist press (y) to create it, or (d) to delete it"
    read n 

    # Delete kasten namespace 
    if [[ $n = d ]]; then

        #Delete helm repository
        echo "--------------------Delete Helm Repo--------------------"
        helm repo remove kasten

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

        #Wait for completely remove Kasten
        echo "--------------------Wait 30s to completely remove k10--------------------"
        sleep 30s
    
    # Create kasten namespace
    elif [[ $n = y ]]; then

      #Create namespace
      echo "--------------------Create Namespace--------------------"
      kubectl create namespace $NAMESPACE || true

      #Add Helm Repo
      echo "--------------------Add Kasten Helm Repo--------------------"
      helm repo add kasten https://charts.kasten.io/ || true

      #Update Helm Repositoies
      echo "--------------------Update Helm Repo--------------------"
      helm repo update

      #Install kasten with helm and port forward
      echo "--------------------Install Kasten--------------------"
      helm install k10 kasten/k10 --namespace=$NAMESPACE || true

      #Wait for the pod to start
      echo "--------------------Wait 1m Pod is Starting--------------------"
      sleep 1m

      #Update helm repo 
      echo "--------------------Update Helm Repo & Upgrade K10--------------------"
      helm repo update && \
          helm get values k10 --output yaml --namespace=kasten-io > k10_val.yaml && \
          helm upgrade k10 kasten/k10 --namespace=kasten-io -f k10_val.yaml || true

      #Port forward
      echo "--------------------Port Forward--------------------"
      kubectl --namespace kasten-io port-forward service/gateway 8080:8000 &

      #open kasten on brwoser
      xdg-open http://127.0.0.1:8080/k10/
    
    fi

  # If minikube is already running then check kasten namespace 
  elif [[ $n = y ]]

  then 

    echo "Check if kasten namespace already exist..!"
    kubectl get ns kasten-io
    
    echo "If kasten-io namespace not exist press (y) to create it, or (d) to delete it"
    read n 
    if [[ $n = d ]]; then

        #Delete helm repository
        echo "--------------------Delete Helm Repo--------------------"
        helm repo remove kasten

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
        
        #Wait for completely remove Kasten
        echo "--------------------Wait 30s to completely remove k10--------------------"
        sleep 30s
    
    elif [[ $n = y ]]; then

      #Create namespace
      echo "--------------------Create Namespace--------------------"
      kubectl create namespace $NAMESPACE

      #Add Helm Repo
      echo "--------------------Add Kasten Helm Repo--------------------"
      helm repo add kasten https://charts.kasten.io/

      #Update Helm Repositoies
      echo "--------------------Update Helm Repo--------------------"
      helm repo update

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
      kubectl --namespace kasten-io port-forward service/gateway 8080:8000 &

      #open kasten on brwoser
      xdg-open http://127.0.0.1:8080/k10/
    
    fi

fi 
