# =============================================================================
# Compu Palace - SQL Server Database
# =============================================================================
# Builds a SQL Server 2022 container with schema, stored procedures,
# and seed data pre-loaded on first startup.
# =============================================================================

FROM mcr.microsoft.com/mssql/server:2022-latest

# Accept the EULA (required for SQL Server)
ENV ACCEPT_EULA=Y

# SA password - override at runtime via docker-compose or docker run
ENV SA_PASSWORD=CompuPalace2024!

# SQL Server configuration
ENV MSSQL_PID=Developer

# Create directory for initialization scripts
RUN mkdir -p /docker-entrypoint-initdb

# Copy SQL scripts in execution order
COPY 01-schema.sql              /docker-entrypoint-initdb/
COPY 02-stored-procedures.sql   /docker-entrypoint-initdb/
COPY 03-seed-data.sql           /docker-entrypoint-initdb/

# Copy and set permissions on entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose SQL Server default port
EXPOSE 1433

# Use custom entrypoint that initializes the database
CMD ["/entrypoint.sh"]
