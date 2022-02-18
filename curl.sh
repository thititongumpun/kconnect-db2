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