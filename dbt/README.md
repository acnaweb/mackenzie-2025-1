

```sh
docker run -d \
    --name postgres \
    --rm \
    -e POSTGRES_USER=new_user \
    -e POSTGRES_PASSWORD=my_pwd \
    -p 5432:5432 \
    postgres
```

```sh
make install
. venv/bin/activate
make profiles

```

- dbname (default database that dbt will build objects in): postgres
- schema (default schema that dbt will build objects in): public

```sh
export DBT_PROFILE_DIR=$(pwd)/profiles
dbt init study_dbt --profiles-dir=$DBT_PROFILE_DIR
export DBT_PROJECT_DIR=$(pwd)/study_dbt
dbt debug --profiles-dir=$DBT_PROFILE_DIR
dbt run --profiles-dir=$DBT_PROFILE_DIR
dbt seed --profiles-dir=$DBT_PROFILE_DIR
dbt compile --profiles-dir=$DBT_PROFILE_DIR

dbt docs generate --profiles-dir=$DBT_PROFILE_DIR
dbt docs serve --profiles-dir=$DBT_PROFILE_DIR
```