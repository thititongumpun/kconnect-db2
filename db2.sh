curl -i -X PUT http://localhost:8083/connectors/db2_source/config \
     -H "Content-Type: application/json" \
     -d '{
            "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
            "connection.url": "jdbc:db2://db2:50000/books",
            "connection.user": "db2inst1",
            "connection.password": "password",
            "mode":"bulk",
            "topic.prefix":"db2_",
            "dialect.name": "Db2DatabaseDialect"
        }'

curl -i -X PUT http://localhost:8083/connectors/db2_source/config \
     -H "Content-Type: application/json" \
     -d '{
            "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
            "connection.url": "jdbc:db2://db2:50000/books",
            "connection.user": "db2inst1",
            "connection.password": "password",
            "table.whitelist": "BOOKS",
            "dialect.name": "Db2DatabaseDialect",
            "mode": "bulk",
            "incrementing.column.name": "PUBLISHED_DATE",
            "topic.prefix": "db2_"
            }
        }'