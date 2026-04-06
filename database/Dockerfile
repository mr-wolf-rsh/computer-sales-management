# =============================================================================
# Compu Palace - SQL Server Database
# =============================================================================
# Builds a SQL Server 2022 container with schema, stored procedures,
# and seed data pre-loaded on first startup.
# =============================================================================

FROM mcr.microsoft.com/mssql/server:2022-latest

# Accept the EULA (required for SQL Server)
ENV ACCEPT_EULA=Y

# SA password - provided by docker-compose via .env file

# SQL Server configuration
ENV MSSQL_PID=Developer

# Switch to root to create init directory, then back to mssql
USER root
RUN mkdir -p /docker-entrypoint-initdb && chown mssql:root /docker-entrypoint-initdb
USER mssql

# Copy SQL scripts in execution order
COPY 01-schema.sql              /docker-entrypoint-initdb/
COPY 02-stored-procedures.sql   /docker-entrypoint-initdb/
COPY 03-seed-data.sql           /docker-entrypoint-initdb/

# Copy and set permissions on entrypoint script
USER root
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
USER mssql

# Expose SQL Server default port
EXPOSE 1433

# Use custom entrypoint that initializes the database
CMD ["/entrypoint.sh"]
