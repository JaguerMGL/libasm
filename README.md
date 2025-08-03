# libasm - Cross-Platform Assembly Library

Ce projet libasm est compatible avec **macOS ARM** et **Linux**.

## Plateformes supportées

### 🍎 **macOS ARM (M1/M2)**
- Compilation croisée automatique vers x86_64
- Utilise les flags `-ld_classic --target=x86_64-apple-darwin`
- Symboles avec double underscore (`__ft_strlen`)

### 🐧 **Linux**
- Compilation native x86_64
- Utilise le flag `--64` pour l'assembleur
- Symboles avec simple underscore (`ft_strlen`)

### 🖥️ **macOS Intel**
- Compilation native x86_64
- Pas de flags spéciaux nécessaires

## Utilisation

```bash
# Compiler la bibliothèque
make all

# Nettoyer les fichiers objets
make clean

# Nettoyer complètement
make fclean

# Recompiler tout
make re

# Voir les informations de plateforme
make debug

# Afficher l'aide
make help
```

## Structure du projet

```
libasm/
├── ft_strlen.s      # Fonction assembleur (multi-plateforme)
├── main.c           # Fichier de test
├── Makefile         # Makefile multi-plateforme
├── objs/            # Dossier des fichiers objets (créé automatiquement)
└── libasm.a         # Bibliothèque compilée
```

## Fonctions implémentées

- `ft_strlen` : Calcule la longueur d'une chaîne de caractères

## Détection automatique

Le Makefile détecte automatiquement :
- Le système d'exploitation (macOS/Linux/Autres)
- L'architecture (ARM64/x86_64)
- Configure les flags appropriés

## Notes techniques

- Les symboles sont définis pour toutes les conventions de nommage
- Compatible avec les projets 42
- Respect des normes d'assembleur Intel syntax
