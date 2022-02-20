curl -i -X PUT http://localhost:8083/connectors/jdbc_source_db2/config \
     -H "Content-Type: application/json" \
     -d '{
            "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
            "connection.url": "jdbc:db2://db2:50000/TESTDB",
            "connection.user": "db2inst1",
            "connection.password": "password",
            "mode":"bulk",
            "topic.prefix":"db2_",
            "dialect.name": "Db2DatabaseDialect"
        }'