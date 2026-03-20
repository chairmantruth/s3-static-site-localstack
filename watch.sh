#!/bin/bash

echo "👀 Watching for changes..."

while inotifywait -e modify index.html; do
    echo "📦 Change detected. Deploying..."
    ./deploy.sh
done
