

### Download K8s Dashboard
`kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml`

Run Dashboard Server
`kubectl proxy`


#### Autherize with token (Powershell)
Get Token 
`$TOKEN=((kubectl -n kube-system describe secret default | Select-String "token:") -split " +")[1]`

Set Credentials
`kubectl config set-credentials docker-for-desktop --token="${TOKEN}"`

Print Token
`${TOKEN}`


# Kubectl
See current configuration
`kubectl config current-context`

See pods
`kubectl get pods`

See detailed info about pod
`kubectl describe pod <pod-name>`

See services
`kubectl get services`


Attach to pod
`kubectl attach <podname> -c <container>`


Set namespace
`kubectl config set-context --current --namespace=<insert-namespace-name-here>`