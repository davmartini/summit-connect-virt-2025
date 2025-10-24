# summit-connect-virt-2025

## Infos pratiques
- Lab : Les VM passent en mode cloud-native avec OpenShift Virtualization
- Horaires : de 14:00 à 15:30
- Participants : 40

## Agenda
- Installation et Intro - 15 mins - [Ready](https://docs.google.com/presentation/d/1nAb9fhzUfAiUU9NHX12mtKRguusiNnWjciTb6pQVEiQ/edit?usp=sharing)
- Création et configuration de VM - 10 mins - Ready
- Création d'un template de VM - 10 mins - Ready
- Mise en place de VLAN externe - 10 mins - Not Ready
- Microsegmentation UDN & Network Policies - 10 - Not Ready
- Load Aware Cluster Rebalancing - 15 mins - Ready
- Backup restore avec Veeam Kasten - 15 mins - Not Ready
- Outro and next step - 5 mins - Not Ready

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
- Upgrade du cluster de 4.18 en 4.19 (1h)
- Installation de l'operateur GitOps
- Déploiement du reste via GitOps
- Configuration du S3 dans Kasten 

## Lab Instructions
https://epietry.github.io/openshift-virt-lab-05-11-2025/
