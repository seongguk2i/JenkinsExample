# 가동중인 jenkinsexample 도커 중단 및 삭제
sudo docker ps -a -q --filter "name=jenkinsexample" | grep -q . && docker stop jenkinsexample && docker rm jenkinsexample | true

# 기존 이미지 삭제
sudo docker rmi seongguk92/jenkinsexample

# 도커허브 이미지 pull
sudo docker pull seongguk92/jenkinsexample

# 도커 run
docker run -d -p 8081:8080 --name jenkinsexample seongguk92/jenkinsexample

# 사용하지 않는 불필요한 이미지 삭제 -> 현재 컨테이너가 물고 있는 이미지는 삭제되지 않습니다.
docker rmi -f $(docker images -f "dangling=true" -q) || true