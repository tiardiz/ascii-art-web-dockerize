echo "[TEST] Building Docker image..."

docker image build -f Dockerfile -t ascii-art-web-docker . || {
    echo "❌ Docker image build failed"
    exit 1
}

docker images || {
    echo "❌ Docker images failed"
    exit 1
}

docker container run -p 8080:8080 --detach --name dockerize ascii-art-web-docker || {
    echo "❌ Docker container run failed"
    exit 1
}
gi
docker ps -a || {
    echo "❌ Docker ps -a failed"
    exit 1
}

docker exec -it dockerize /bin/sh -c "ls -l" || {
    echo "❌ Docker exec failed"
    exit 1
}
echo "✅ Docker build passed"