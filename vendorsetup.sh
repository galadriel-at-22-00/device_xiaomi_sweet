#!/bin/bash

step() {
  echo -e "\n==> $1"
}

# Apply Source Patches
step "Patching bionic..."
(
  cd bionic/ || exit 1
  git fetch git@github.com:galadriel-at-22-00/bionic.git sixteen
  git cherry-pick 5dec04c5c621c070895774b9c26a6ed32715141a
)

step "Patching frameworks/base..."
(
  cd frameworks/base || exit 1
  git fetch git@github.com:galadriel-at-22-00/frameworks_base.git sixteen
  git cherry-pick 97e20b2^..318ddb1
)

step "Patching frameworks/av..."
(
  cd frameworks/av || exit 1
  git fetch git@github.com:galadriel-at-22-00/frameworks_av.git sixteen
  git cherry-pick 343994d^..61c568f
)

step "Patching frameworks/native..."
(
  cd frameworks/native || exit 1
  git fetch git@github.com:galadriel-at-22-00/frameworks_native.git sixteen
  git cherry-pick d090a5c^..2d3604b
)

step "Patching hardware/lineage/compat..."
(
  cd hardware/lineage/compat || exit 1
  git fetch git@github.com:galadriel-at-22-00/hardware_lineage_compat.git sixteen
  git cherry-pick ec932b2^..61fc543
)

step "Patching packages/apps/Settings..."
(
  cd packages/apps/Settings || exit 1
  git fetch git@github.com:galadriel-at-22-00/packages_apps_Settings.git sixteen
  git cherry-pick 231de93^..770febc
)

step "Cloning packages/apps/KProfiles"
(
  rm -rf packages/apps/KProfiles
  git clone https://github.com/galadriel-at-22-00/packages_apps_KProfiles packages/apps/KProfiles
)

step "Patching system/core..."
(
  cd system/core || exit 1
  git fetch git@github.com:galadriel-at-22-00/system_core.git sixteen
  git cherry-pick 78b62fa5f43477816f43734cb406ae91a0af0222
)

step "Patching system/libhwbinder..."
(
  cd system/libhwbinder || exit 1
  git fetch https://github.com/Evolution-X/system_libhwbinder.git bka
  git cherry-pick bdb89a4855711d023e0b70f31745b825a9410095
)

step "Patching vendor/yaap..."
(
  cd vendor/yaap || exit 1
  git fetch git@github.com:galadriel-at-22-00/vendor_yaap.git sixteen
  git cherry-pick d175f11^..713fb18
)

# Clone Signing Keys
step "Setting up signing keys..."
(
  if [ -d vendor/yaap/signing/keys ]; then
    echo "Removing existing signing keys..."
    rm -rf vendor/yaap/signing/keys
  fi

  echo "Cloning fresh signing keys..."
  git clone git@github.com:galadriel-at-22-00/keys.git -b YAAP-sixteen vendor/yaap/signing/keys
>>>>>>> a868ab1 (sweet: YAAP bringup)
)

echo -e "\nAll steps completed successfully!"
