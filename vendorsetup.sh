#!/bin/bash

step() {
  echo -e "\n==> $1"
}

# Clone Signing Keys
step "Setting up signing keys..."
(
  if [ -d vendor/lineage-priv/keys ]; then
    echo "Removing existing signing keys..."
    rm -rf vendor/lineage-priv/keys
  fi

  echo "Cloning fresh signing keys..."
  git clone git@github.com:galadriel-at-22-00/keys.git -b lineage-23.0 vendor/lineage-priv/keys
)

echo -e "\nAll steps completed successfully!"
