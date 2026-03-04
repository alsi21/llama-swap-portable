# pwd

docker pull ghcr.io/mostlygeek/llama-swap:v192-cuda-b8087

# configuration hot reload supported with a directory volume mount
docker run -it --runtime nvidia --name llama-swap --restart always -d -p 9292:8080 \
    -v ./models:/models \
    -v ./config.yaml:/app/config.yaml \
    -v /var/run/docker.sock:/var/run/docker.sock \
    ghcr.io/mostlygeek/llama-swap:v192-cuda-b8087 -config ./config.yaml -watch-config

docker exec -it --user root llama-swap apt-get update
docker exec -it --user root llama-swap apt-get install docker.io -y
# docker exec -it --user root llama-swap usermod -a -G docker $USER
# docker exec -it --user root llama-swap grep docker /etc/group
docker exec -it --user root llama-swap chmod 666 /var/run/docker.sock