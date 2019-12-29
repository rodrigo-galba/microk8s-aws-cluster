# MicroK8s

## Master setup

```sh
sudo snap install microk8s --classic --channel=1.16/stable
sudo usermod -a -G microk8s $USER
su - $USER

# not required on EC2 instances
# iptables -P INPUT ACCEPT
# sudo iptables -P INPUT ACCEPT
# sudo iptables -P OUTPUT ACCEPT
# sudo iptables -P FORWARD ACCEPT
# sudo iptables -F

microk8s.enable dns dashboard
```

Add --allow-privileged=true to:
```
# kubelet config
sudo vim /var/snap/microk8s/current/args/kubelet

#kube-apiserver config
sudo vim /var/snap/microk8s/current/args/kube-apiserver
```

Restart services:

```sh   
sudo systemctl restart snap.microk8s.daemon-kubelet.service
sudo systemctl restart snap.microk8s.daemon-apiserver.service
```

microk8s.add-node

# use given microk8s.add-node on desired nodes

microk8s.kubectl apply -f admin-user.yml
# change service to NodePort type
microk8s.kubectl edit svc/kubernetes-dashboard --namespace=kube-system
# get generated prot for service
microk8s.kubectl describe svc kubernetes-dashboard -n kube-system

# curl https://master-ip:30000/#/overview?namespace=default

# get current token to access dashboard
microk8s.kubectl describe secret microk8s-admin-token-scprz -n kube-system
```

## Nodes setup

```sh
sudo snap install microk8s --classic --channel=1.16/stable
sudo usermod -a -G microk8s $USER
su - $USER

# run microk8s.add-node on master and take given command to run it here
# microk8s.join 10.101.47.41:25000/GRoHnMJkEMLCaGvUMtPOCNoFHHyhBNyp

```

## Troubleshoot

On master, the port 25000 is required to be opened.

```
microk8s.inspect
```

## Attention notes

- How to install helm?
- How to use Docker as container runtime interface?

## Helm setup

```sh
microk8s.enable helm
microk8s.helm init
```

## MysqL setup

```
microk8s.helm install --name mysql-cluster bitnami/mysql --set slave.replicas=3,root.password=s3cr3t,user.database=app_database,master.persistence.storageClass=microk8s-hostpath,slave.persistence.storageClass=microk8s-hostpath
```

Edit service port
```
microk8s.kubectl edit svc rds-mysql
microk8s.kubectl describe svc rds-mysql
```

```sql
CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    status TINYINT NOT NULL,
    priority TINYINT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB;
```

## MongoDB replica set

```sh
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install --name aws-mongo stable/mongodb-replicaset --set persistentVolume.storageClass=microk8s-hostpath
```

[1]: https://github.com/ubuntu/microk8s
