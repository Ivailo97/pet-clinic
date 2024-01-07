#for creating volumes
docker volume create mysql_data
docker volume create mysql_config

#for creating network
docker network create mysqlnet

#for attaching the volumes and run mysql in a container
docker run -it --rm -d \
-v mysql_data:/var/lib/mysql \
-v mysql_config:/etc/mysql/conf.d \
--network mysqlnet \
--name mysqlserver \
-e MYSQL_USER=petclinic -e MYSQL_PASSWORD=petclinic \
-e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=petclinic \
-p 3306:3306 mysql:8.0

#for running the application connected to the mysql database
#with exposed ports [host port]:[container port]
docker run --rm -d \
--name springboot-server \
--network mysqlnet \
-e MYSQL_URL=jdbc:mysql://mysqlserver/petclinic \
-p 8080:8080 java-docker

# attach this to the previous command to run with tests
# ./mvnw test



#tests that the application is connected to the database
#curl  --request GET \
#  --url http://localhost:8080/vets \
#  --header 'content-type: application/json'


#for running the compose file
docker compose -f docker-compose.dev.yml up --build
#for details about containers
#docker ps -a

#for stopping the container
#docker stop springboot-server

#for restarting the container (faster start than run command)
#docker restart springboot-server

#removing the container
#docker rm springboot-server
