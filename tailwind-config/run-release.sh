#!/bin/bash

# Copy tw-elements and start tailwind in watch mode
mkdir -p app/public/js/dist
cp node_modules/tw-elements/dist/js/index.min.js app/public/js/dist/tw-elements.min.js
npm run build:css