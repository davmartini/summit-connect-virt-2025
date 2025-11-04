# summit-connect-virt-2025

## Infos pratiques
- Lab : Les VM passent en mode cloud-native avec OpenShift Virtualization
- Horaires : de 14:00 à 15:30
- Participants : 40

## Agenda
- Installation et Intro - 15 mins - [Ready](https://docs.google.com/presentation/d/1nAb9fhzUfAiUU9NHX12mtKRguusiNnWjciTb6pQVEiQ/edit?usp=sharing)
- Création et configuration de VM - 10 mins - Ready
- Création d'un template de VM - 10 mins - Ready
- Mise en place de VLAN externe - 10 mins - Ready
- Microsegmentation UDN & Network Policies - 10 - Ready
- Backup restore avec Veeam Kasten - 15 mins - Not Ready
- Outro and feedback - 5 mins - Ready

## To Do
- Remplacer la partie MetalLB par UDN
- Update de la doc avec la partie micro-seg avec les multi-netpol
- Automatiser les différentes étapes de proviosnning
  * Création des 40 users/password via htpasswd
  * Upgrade le cluster de 4.18 à 4.19
  * Installation des operateurs Terminal/MTV/Kasten
  * Création d'un bucket S3 pour Kasten
  * Déploiment de Kasten en mode token pour l'auth
 
## To Do le jour J
- Déploiement du cluster (2h)
- Upgrade du cluster de 4.18 en 4.19 (2h)
- Update de l'operateur OpenShift Virtualization en 4.19 et reload de l'interface si nécessaire
- Mettre a jour le lien vers le cluster dans les mails
- Installation de l'operateur Veeam Kaster
- Déploiemen de k10
- Annotation des StorageClass pour Kasten
- Déploiement du reste via GitOps
- Configuration du S3 dans Kasten 

## Lab Instructions
https://epietry.github.io/openshift-virt-lab-05-11-2025/

## Kasten setup
- install de l'operateur
- créer l'objet k10 avec la config pour l'auth
```
  auth:
    openshift:
      dashboardURL: 'https://k10-route-kasten-io.apps.cluster-7mv8f.7mv8f.gcp.redhatworkshops.io/k10/'
      enabled: true
      insecureCA: true
      openshiftURL: 'https://apiserver.openshift-kube-apiserver.svc.cluster.local'
  route:
    enabled: true
    tls:
      enabled: true
``` 

- Créer un bucket S3 dans le namespace Kasten-io créer un profile pour tout le monde dans kasten en tant qu'admin

- Annotation des storage classe
```
oc annotate volumesnapshotclass \
  ocs-external-storagecluster-rbdplugin-snapclass  \
  k10.kasten.io/is-snapshot-class=true

oc annotate volumesnapshotclass \
  ocs-external-storagecluster-cephfsplugin-snapclass \
  k10.kasten.io/is-snapshot-class=true

kubectl annotate storageclass ocs-external-storagecluster-ceph-rbd k10.kasten.io/sc-supports-block-mode-exports=true
```