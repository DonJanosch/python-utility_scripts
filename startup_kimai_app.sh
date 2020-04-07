PUBLISHED_PORT=8001

mkdir app && cd $_
curl https://raw.githubusercontent.com/jmacenka/docker_compose_apps/master/kimai_docker-compose.yaml >> docker-compose.yaml

docker-compose up -build --force-recreate
echo "All Done, Containers are up and running. Visite http://$(hostname -I | cut -d' ' -f1):$PUBLISHED_PORT"
