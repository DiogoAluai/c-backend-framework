#!/bin/bash


if [ -e "/usr/local/bin/generate-backend" ]; then
    echo "/usr/local/bin/generate-backend exists, aborting installation"
    exit 1
fi

chmod +x generate-backend.sh || {
  echo "Failed to give execution permissions to ./generate-backend.sh"
  exit 1
}
sudo cp generate-backend.sh /usr/local/bin/generate-backend

sudo mkdir -p /opt/daluai-c-backend-framework
sudo cp -r templates /opt/daluai-c-backend-framework/

echo "Done"
