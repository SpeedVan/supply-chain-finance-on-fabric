unset http_proxy
unset https_proxy
kubectl scale --replicas=1 deploy/tools deploy/orderer0 deploy/orderer1 deploy/orderer2 -n orderer-supply-com

kubectl scale --replicas=1 deploy/peer0 -n core-supply-com

kubectl scale --replicas=1 deploy/peer0 -n f1-supply-com

kubectl scale --replicas=1 deploy/peer0 -n s1-supply-com

kubectl scale --replicas=1 deploy/peer0 -n s2-supply-com