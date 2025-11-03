#!/bin/bash

# Le nom du ClusterRole Kasten (vérifiez-le avec 'oc get clusterrole | grep basic')
ROLE_KASTEN="k10-basic"

echo "Application des permissions Kasten k10-basic..."

for i in $(seq 1 40); do
  UTILISATEUR="user$i"
  NAMESPACE="project-$i" # Basé sur votre exemple (project-35)

  echo "Attribution du rôle $ROLE_KASTEN à $UTILISATEUR dans le namespace $NAMESPACE..."

  # Crée un RoleBinding dans le namespace $NAMESPACE
  # qui lie le ClusterRole $ROLE_KASTEN
  # à l'utilisateur $UTILISATEUR
  oc adm policy add-role-to-user "$ROLE_KASTEN" "$UTILISATEUR" -n "$NAMESPACE"

  # Vérification (optionnelle)
  if [ $? -ne 0 ]; then
    echo "ERREUR: Impossible d'appliquer la permission pour $UTILISATEUR dans $NAMESPACE."
    echo "Vérifiez si le namespace '$NAMESPACE' existe."
  fi

done

echo "Terminé."
