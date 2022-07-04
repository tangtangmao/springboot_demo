harbor_add=$1
harbor_repo=$2
project=$3
version=$4
container_port=$5
host_port=$6
image_name=$harbor_add/$harbor_repo/$project:$version
echo "harbor addres is $harbor_add repo :$repo project:$project version:$version"
echo "image name is: $image_name"
container_id=`docker ps -a |grep $project |awk '{print$1}'`
echo $container_id
if [ "$container_id" != "" ] ; then
  docker stop $container_id
  docker rm $container_id
  echo "delete container Success"
fi
tag=`docker ps -a |grep nginx |awk '{print$2}'`
echo "tag :$tag"

if [ "$tag" != "$version" ]; then
docker rmi $image_name
echo "delete image Success"
fi
docker login -u admin -p Harbor12345 $harbor_add
docker pull $image_name
docker run -d -p $container_port:$host_port --name $project $image_name
echo "start new Container Sucess"
