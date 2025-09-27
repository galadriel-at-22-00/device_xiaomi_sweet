#!/bin/bash

step() {
  echo -e "\n==> $1"
}

step "Cloning packages/apps/KProfiles"
(
  rm -rf packages/apps/KProfiles
  git clone https://github.com/galadriel-at-22-00/packages_apps_KProfiles packages/apps/KProfiles
)

echo -e "\nAll steps completed successfully!"
