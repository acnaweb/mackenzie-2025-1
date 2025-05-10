# Mackenzie

MBA em DevOps Engineering and Cloud Solutions

## Pessoas

###  [Apresentações](docs/apresentacao.md)

## DBRE (Database Reliability Engineer) e DataOps

### Conteúdo Programático

* DBRE e DataOps
* Gestão e Governança de Dados
* LGPD
* Arquitetura de Dados Relacionais
* Arquitetura NoSQL
* Soluções de Armazenamento de Dados na Nuvem
* Controle de versão em banco de dados com migrations

### Metodologia

- Contexto
- Perguntas/Dúvidas/Desafios
- Soluções
- Implementação da solução

## Conceitos

### Data Pipeline

![](https://d2908q01vomqb2.cloudfront.net/b6692ea5df920cad691c20319a6fffd7a4a766b8/2019/12/12/ETLandELTRedshift1.png)

- https://aws.amazon.com/pt/compare/the-difference-between-etl-and-elt/

### Eventos

![](https://cdn.prod.website-files.com/6475df10614983200b234b6b/66c72c0d833fd8bf5c89dd80_64aee0a3fd46d7427c44b22b_62d9634beaaed1510c28ceeb_comms_diagramas-blog-mensageria_julho_2022-02.png)
- https://www.sensedia.com.br/post/o-que-e-mensageria-tudo-o-que-voce-precisa-saber

## Tools

### Install PlantUML Ubuntu/Code Space

```sh
sudo apt update
sudo apt install graphviz
pip3 install pydot graphviz
```

### IaC (Docker)

```
docker build -t devops .
docker run --name devops -it --rm -v ./infra:/shared devops /bin/bash
```

### Linux (notas)

```
sudo apt update
sudo apt upgrade

cd /etc/apt
ls -la
cat sources.lst

sudo apt list python* | grep install
which python3
sudo ln -s /usr/bin/python3 /usr/bin/python

# path atual
pwd 

whoami

cd ~

mkdir projects

- SSH
chave privada = /home/ac/.ssh/id_rsa
chave pública = /home/ac/.ssh/id_rsa.pub (compartilho)
ssh-keygen -t rsa 


ls ~/.ssh -la
cat ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub

export $(cat .env | xargs)
```

### Windows (notas)

```sh
$env:VAR1="Mackenzie"
$env:VAR1
Get-ChildItem env:
```

## Referencias

- [Data Ingestion/Airbyte: Site Oficial](https://airbyte.com/)
- [Data Ingestion/Airbyte: Install](https://github.com/acnaweb/airbyte)
- [Data Transformation/dbt Adapters: truested](https://docs.getdbt.com/docs/trusted-adapters)
- [Data Transformation/dbt Adapters: community](https://docs.getdbt.com/docs/community-adapters)
- [Data Transformation/SQL CTE](https://www.atlassian.com/data/sql/using-common-table-expressions)
- [Data Product: Data Contract](https://datacontract.com/)
- [Databases: Containers](https://github.com/acnaweb/database)
- [Test Container](https://testcontainers.com/)
- [Python: Install](https://www.python.org/downloads/)
- [Python: Repo template](https://github.com/acnaweb/python)
- [Pypi: repositório de artefatos Python](https://pypi.org/)
- [The 2024 MAD (ML, AI & Data) Landscape](https://mad.firstmark.com/)
- [Gitignore.io](https://www.toptal.com/developers/gitignore/)
- [Pre-commit](https://pre-commit.com/)
- [Makefile in Windows](https://medium.com/@samsorrahman/how-to-run-a-makefile-in-windows-b4d115d7c516)
- [Jinja: Template Engine](https://jinja.palletsprojects.com/en/3.1.x/)
- https://docs.getdbt.com/docs/build/custom-schemas
- https://www.databricks.com/glossary/medallion-architecture
- https://rivery.io/data-learning-center/types-of-etl-data-transformation/
- https://github.com/plantuml-stdlib/C4-PlantUML
- https://c4model.com/
- https://dataengineering.wiki/Index
- https://learn.microsoft.com/pt-br/power-bi/guidance/star-schema
- https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/books/data-warehouse-dw-toolkit/
- https://github.com/acnaweb/iac
- https://realpython.com/


