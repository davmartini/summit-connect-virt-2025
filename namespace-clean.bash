#!/bin/bash

echo "#########################################################"
echo "ATTENTION : Ce script va supprimer 4 namespaces"
echo "           pour chaque utilisateur de 1 à 40."
echo "           (Total: 160 namespaces)"
echo "Appuyez sur Entrée pour continuer, ou Ctrl+C pour annuler."
echo "#########################################################"
read

echo "Début de la suppression..."
echo "---"

for i in $(seq 1 40); do
  # Définir les noms des namespaces pour l'utilisateur
  NS_MTV="mtv-user$i"
  NS_OADP="oadp-user$i"
  NS_VMEX="vmexamples-user$i-udn"
  NS_VMIP="vmiported-user$i"

  echo "Tentative de suppression des namespaces pour l'utilisateur $i :"
  echo "* $NS_MTV"
  echo "* $NS_OADP"
  echo "* $NS_VMEX"
  echo "* $NS_VMIP"

  # Exécuter la commande de suppression pour les 4 namespaces
  # L'option --ignore-not-found=true évite une erreur si un namespace n'existe pas
  oc delete namespace \
    "$NS_MTV" \
    "$NS_OADP" \
    "$NS_VMEX" \
    "$NS_VMIP" \
    --ignore-not-found=true

  echo "---"
done

echo "Toutes les commandes de suppression ont été envoyées."
echo "La suppression s'effectue en arrière-plan dans le cluster."