# Minio

https://min.io/docs/minio/container/index.html

## Docker

```sh
docker compose up
```


## Minio Client

https://min.io/docs/minio/linux/reference/minio-mc.html?ref=docs

```sh
echo "🔗 Conectando ao MinIO com mc..."
docker exec -i minio-client mc alias set local http://minio:9000 admin miniopwd

echo "🪣 Criando bucket chamado 'meu-bucket'..."
docker exec -i minio-client mc mb local/meu-bucket

echo "📂 Enviando arquivo para o bucket..."
echo "Este é um teste de upload via MinIO Client (mc)" > arquivo.txt
docker cp README.md minio-client:/README.md
docker exec -i minio-client mc cp /README.md local/meu-bucket/

echo "📋 Listando arquivos no bucket..."
docker exec -i minio-client mc ls local/meu-bucket/
```