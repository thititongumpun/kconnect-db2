curl -i -X PUT http://localhost:8083/connectors/jdbc_source_postgres_01/config \
     -H "Content-Type: application/json" \
     -d '{
            "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
            "connection.url": "jdbc:db2://db2:50000/testdb",
            "connection.user": "db2inst1",
            "connection.password": "password",
            "mode":"incrementing",
            "incrementing.column.name":"city_id",
            "topic.prefix":"postgres_",
            "transforms":"copyFieldToKey,extractKeyFromStruct",
            "transforms.copyFieldToKey.type":"org.apache.kafka.connect.transforms.ValueToKey",
            "transforms.copyFieldToKey.fields":"city_id",
            "transforms.extractKeyFromStruct.type":"org.apache.kafka.connect.transforms.ExtractField$Key",
            "transforms.extractKeyFromStruct.field":"city_id",
            "dialect.name": "Db2DatabaseDialect"
        }'


curl -i -X PUT http://localhost:8083/connectors/jdbc_source_postgres_01/config \
     -H "Content-Type: application/json" \
     -d '{
            "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
            "tasks.max": "1",
            "topics": "postgres_cities",
            "connection.url": "jdbc:db2://db2:50000/testdb;",
            "connection.user": "db2inst1",
            "connection.password": "password",
            "connection.ds.pool.size": "1",
            "insert.mode.databaselevel": "true",
            "table.name.format": "testdb.cities",
            "insert.mode": "insert",
            "dialect.name": "Db2DatabaseDialect",
            "value.converter.schema.registry.url": "http://schema-registry:8081/",
            "key.converter": "org.apache.kafka.connect.storage.StringConverter",
            "value.converter": "io.confluent.connect.avro.AvroConverter",
            "schema.registry.url": "http://schema-registry:8081/"
          }
        }'
