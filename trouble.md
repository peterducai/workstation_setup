# oc get bc mpos-verification -oyaml &> bc.txt
# oc logs bc/mpos-verification &> bclogs.txt
# oc version &> version.txt
# oc get pods -owide &> pods.txt
# curl -v docker-registry.default.svc.cluster.local:5000/healthz &> healthz.txt
# oc get nodes -owide &> node.txt
# oc project &> project.txt
# oc whoami &> whoami.txt
# oc get rolebinding &> role.txt

## Basics

oc get nodes -o wide

oc get pods --all-namespaces
oc rsh po/<pod-name>




restarting etcd one at a time on each etcd host resolves the issue
systemctl restart etcd




## Operators

$ oc get csv <operator> -n <namespace> -o yaml
$ oc get sub <operator> -n <namespace> -o yaml


$ oc describe co <operator> (for Cluster operator)

oc get packagemanifests -n openshift-marketplace

$ oc get subscription jaeger -n openshift-operators -o yaml | grep currentCSV
  currentCSV: jaeger-operator.v1.8.2

$ oc delete subscription jaeger -n openshift-operators
subscription.operators.coreos.com "jaeger" deleted

$ oc delete clusterserviceversion jaeger-operator.v1.8.2 -n openshift-operators
clusterserviceversion.operators.coreos.com "jaeger-operator.v1.8.2" deleted

$ oc describe sub <subscription_name>
In the command output, find the Conditions section:

## MachineConfig 

$ oc get machineconfig

This provides a list of the available machine configuration objects you can select. By default, the two kubelet-related configs are 01-master-kubelet and 01-worker-kubelet.


## MachineSet

oc get machinesets -n openshift-machine-api

### Remove node from cluster

Mark the node as unschedulable by running the oc adm cordon command:
$ oc adm cordon <node_name> 

Specify the node name of one of the RHCOS compute machines.
Drain all the pods from the node:
$ oc adm drain <node_name> --force --delete-local-data --ignore-daemonsets 

Specify the node name of the RHCOS compute machine that you isolated.
Delete the node:
$ oc delete nodes <node_name> 

Specify the node name of the RHCOS compute machine that you drained.
Review the list of compute machines to ensure that only the RHEL nodes remain:
$ oc get nodes -o wide

## Registry

curl -kv https://docker-registry.default.svc.cluster.local:5000/healthz

$ oc describe pod docker-registry-2-n8d21
Name:                docker-registry-2-n8d21
Namespace:            default
Image(s):            registry.access.redhat.com/openshift3/ose-docker-registry:v3.1.1.6
Node:                infra01.ose.example.com/192.168.200.61

Check to see if the mount point exists on the node (in this case infra01)

[root@infra01 ~]# mount \|grep origin
(rw,relatime,rootcontext="system_u:object_r:svirt_sandbox_file_t:s0:c0,c1",seclabel)

getsebool virt_use_nfs
virt_use_nfs --> off

Set this boolean to on across any node that will host pods which may require NFS access (such as databases, registries etc):

setsebool -P virt_use_nfs=true



## CSR

oc get csr

NAME        AGE     REQUESTOR                                                                   CONDITION
csr-8b2br   15m     system:serviceaccount:openshift-machine-config-operator:node-bootstrapper   Pending 
csr-8vnps   15m     system:serviceaccount:openshift-machine-config-operator:node-bootstrapper   Pending
csr-bfd72   5m26s   system:node:ip-10-0-50-126.us-east-2.compute.internal                       Pending 
csr-c57lv   5m26s   system:node:ip-10-0-95-157.us-east-2.compute.internal                       Pending
...


oc adm certificate approve <csr_name>
oc get csr -o go-template='{{range .items}}{{if not .status}}{{.metadata.name}}{{"\n"}}{{end}}{{end}}' | xargs oc adm certificate approve


## ETCD

fio --rw=write --ioengine=sync --fdatasync=1 --directory=test-data --size=22m --bs=2300 --name=mytest


https://github.com/etcd-io/etcd/blob/master/Documentation/faq.md#what-does-the-etcd-warning-failed-to-send-out-heartbeat-on-time-mean



## Monitoring

1. Run the next commands to check the Elasticsearch health status, and attach the output:
 $ oc project openshift-logging
 $ es_pod=$(oc get po --selector=component=es --no-headers -o jsonpath='{range .items[?(@.status.phase=="Running")]}{.metadata.name}{"\n"}{end}' | head -n1)
 $ oc exec $es_pod -- curl -s --key /etc/elasticsearch/secret/admin-key --cert /etc/elasticsearch/secret/admin-cert --cacert /etc/elasticsearch/secret/admin-ca https://localhost:9200/_cat/health?v
 $ oc exec $es_pod -- curl -s --key /etc/elasticsearch/secret/admin-key --cert /etc/elasticsearch/secret/admin-cert --cacert /etc/elasticsearch/secret/admin-ca https://localhost:9200/_cat/indices?v
 $ oc exec $es_pod -- curl -s --key /etc/elasticsearch/secret/admin-key --cert /etc/elasticsearch/secret/admin-cert --cacert /etc/elasticsearch/secret/admin-ca https://localhost:9200/_cat/shards?h=index,shard,prirep,state,unassigned.reason,node | grep UNASSIGNED
 $ for pod in `oc get po -l component=es -o jsonpath='{.items[*].metadata.name}'`; do echo $pod; oc exec $pod -- df -h /elasticsearch/persistent; done

2. Get the fluentd pods logs
 $ oc project openshift-logging
 $ for pod in `oc get po -l component=fluentd -o jsonpath='{.items[*].metadata.name}'`; do echo $pod; oc logs $pod 2>&1 | tail -n 10 ; done



  Great comment how to download from flopbox.corp.redhat.com using the curl and USER, PASSWROD, and FILE variables at https://mojo.redhat.com/docs/DOC-52482


## Offline

https://cloud.redhat.com/openshift/register

## Realtime

 Create the following Dockerfile:

# vim Dockerfile
FROM rhel8
RUN subscription-manager repos --enable=rhel-8-for-x86_64-rt-rpm
RUN dnf -y install rt-tests
ENTRYPOINT cyclictest --smp -p95

Build the container image from the directory containing the Dockerfile:

# podman build -t cyclictest .

Run the container using the image you built in the previous step:

# podman run --device=/dev/cpu_dma_latency --cap-add ipc_lock --cap-add \
	sys_nice --cap-add sys_rawio --rm -ti cyclictest