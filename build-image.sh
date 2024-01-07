# docker build --tag java-docker .


# build specially with the test build stage
docker build -t java-docker --target test .

#run the test-ready image to see if the tests pass
#docker run -it --rm --name springboot-test java-docker

# for renaming the image / creating a tag
# docker tag java-docker:latest java-docker:v1.0.0

# for removing image/tag
# docker rmi java-docker:v1.0.0



#set the origin of this repository to the test-repository with the ci/cd actions enabled
#git remote set-url origin https://github.com/ivakis/pet-clinic.git
