unset http_proxy
unset https_proxy
kubectl scale --replicas=1 deploy/orderer0 deploy/orderer1 deploy/orderer2 -n orderer-supply-com

# kubectl scale --replicas=1 deploy/peer0 deploy/dind -n core-supply-com
kubectl scale --replicas=1 deploy/peer0 deploy/channel1-cc1 -n core-supply-com

# kubectl scale --replicas=1 deploy/peer0 deploy/dind -n f1-supply-com
kubectl scale --replicas=1 deploy/peer0 deploy/channel1-cc1 -n f1-supply-com

# kubectl scale --replicas=1 deploy/peer0 -n s1-supply-com

# kubectl scale --replicas=1 deploy/peer0 -n s2-supply-com