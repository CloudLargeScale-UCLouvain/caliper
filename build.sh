#!/bin/bash
# Supposes docker login has been launched
# Reset scripts
# scripts/force-clean.sh ; npm i ; npm run repoclean ; npm run bootstrap
set -v
cd packages/caliper-publish
./publish.js verdaccio start
sleep 5s
./publish.js npm --registry http://localhost:4873
./publish.js docker --registry http://localhost:4873 --image caliper --tag b2c2
./publish.js verdaccio stop
docker tag caliper:b2c2 ayhamkassab/caliper:b2c2
docker push ayhamkassab/caliper:b2c2