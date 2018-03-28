startTotal=$SECONDS
echo "Building ERX Resource Bundle"
start=$SECONDS
cd /vagrant/project/webapp/erx-resource-bundle
#git pull

#mvn clean install -Dmaven.test.skip=true --quiet
end=$SECONDS
elapsed=$((end - start))
printf 'Elapsed %d:%02d:%02d\n' \
       $((elapsed / 3600)) $((elapsed / 60 % 60)) $((elapsed % 60))
echo "Building hit-core (1/5)"
start=$SECONDS
cd /vagrant/project/webapp/hit-core
#git pull
mvn clean install -DskipTests --quiet
end=$SECONDS
elapsed=$((end - start))
printf 'Elapsed %d:%02d:%02d\n' \
       $((elapsed / 3600)) $((elapsed / 60 % 60)) $((elapsed % 60))
echo "Building hit-core-edi (2/5)"
start=$SECONDS
cd /vagrant/project/webapp/hit-core-edi
#git pull
#mvn clean install -Dmaven.test.skip=true --quiet
end=$SECONDS
elapsed=$((end - start))
printf 'Elapsed %d:%02d:%02d\n' \
       $((elapsed / 3600)) $((elapsed / 60 % 60)) $((elapsed % 60))
echo "Building hit-core-xml (3/5)"
start=$SECONDS
cd /vagrant/project/webapp/hit-core-xml
#git pull
#mvn clean install -Dmaven.test.skip=true --quiet
end=$SECONDS
elapsed=$((end - start))
printf 'Elapsed %d:%02d:%02d\n' \
       $((elapsed / 3600)) $((elapsed / 60 % 60)) $((elapsed % 60))
echo "Building hit-erx-tool-config-ncpdp (4/5)"
start=$SECONDS
cd /vagrant/project/webapp/hit-erx-tool-config-ncpdp
#git pull
mvn clean install -DskipTests --quiet
end=$SECONDS
elapsed=$((end - start))
printf 'Elapsed %d:%02d:%02d\n' \
       $((elapsed / 3600)) $((elapsed / 60 % 60)) $((elapsed % 60))
echo "Building hit-base-tool-ncpdp (5/5)"
start=$SECONDS
cd /vagrant/project/webapp/hit-base-tool-ncpdp
#git pull
mvn clean install -DskipTests --quiet
end=$SECONDS
elapsed=$((end - start))
printf 'Elapsed %d:%02d:%02d\n' \
       $((elapsed / 3600)) $((elapsed / 60 % 60)) $((elapsed % 60))
elapsed=$((end - startTotal))
printf 'Process completed in %d:%02d:%02d' \
       $((end / 3600)) $((end / 60 % 60)) $((end % 60))