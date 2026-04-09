#!/bin/sh

echo " Vérification du code avant commit..."

# Vérifie si le dossier laravel existe
if [ -d "laravel" ]; then
  cd laravel

  # Vérifie si npm est installé
  if command -v npm >/dev/null 2>&1; then
    echo "Lancement du linter..."
    npm run lint

    # Si erreur → bloque commit
    if [ $? -ne 0 ]; then
      echo "Linter échoué, commit annulé."
      exit 1
    fi
  else
    echo "npm non trouvé, lint ignoré"
  fi
else
  echo "Dossier laravel introuvable"
fi

echo "Vérification terminée"
exit 0