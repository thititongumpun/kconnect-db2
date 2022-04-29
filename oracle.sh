curl -i -X PUT http://localhost:8083/connectors/oracle_source/config \
     -H "Content-Type: application/json" \
     -d '{
            "name": "oracle_source",
            "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
            "connection.url": "jdbc:oracle:thin:test/Welcome1@132.226.13.161:1521:orcldb",
            "table.whitelist": "CITIES",
            "dialect.name": "OracleDatabaseDialect",
            "mode": "bulk",
            "incrementing.column.name": "CITY_ID",
            "topic.prefix": "oracle_"
            }
          }'


# curl -i -X PUT http://localhost:8083/connectors/db2_source/config \
#      -H "Content-Type: application/json" \
#      -d '{
#             "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
#             "connection.url": "jdbc:db2://db2:50000/books",
#             "connection.user": "db2inst1",
#             "connection.password": "password",
#             "table.whitelist": "BOOKS",
#             "dialect.name": "Db2DatabaseDialect",
#             "mode": "bulk",
#             "incrementing.column.name": "PUBLISHED_DATE",
#             "topic.prefix": "db2_"
#             }
#         }'