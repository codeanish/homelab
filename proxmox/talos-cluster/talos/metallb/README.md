1. Run the following kubectl command to install metallb in cluster

`kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.9/config/manifests/metallb-native.yaml`

2. Apply the metallb.yml file

`kubectl apply -f metallb.yml`

3. Apply the metallb-advertise.yml file

`kubectl apply -f metallb-advertise.yml`