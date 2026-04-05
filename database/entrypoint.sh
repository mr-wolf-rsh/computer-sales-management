#!/bin/bash
# =============================================================================
# Compu Palace - Database Entrypoint
# =============================================================================
# Starts SQL Server, waits for readiness, runs migration scripts in order,
# then keeps the container alive.
# =============================================================================

set -e

SCRIPTS_DIR="/docker-entrypoint-initdb"
SQLCMD="/opt/mssql-tools18/bin/sqlcmd"
SA_PASSWORD="${MSSQL_SA_PASSWORD:-${SA_PASSWORD:-CompuPalace2026!}}"

echo "[entrypoint] Starting SQL Server..."
/opt/mssql/bin/sqlservr &
SQL_PID=$!

# Wait for SQL Server to accept connections (up to 60 seconds)
echo "[entrypoint] Waiting for SQL Server to be ready..."
MAX_RETRIES=30
RETRY_INTERVAL=2
RETRIES=0

until ${SQLCMD} -S localhost -U sa -P "${SA_PASSWORD}" -C -Q "SELECT 1" > /dev/null 2>&1; do
    RETRIES=$((RETRIES + 1))
    if [ ${RETRIES} -ge ${MAX_RETRIES} ]; then
        echo "[entrypoint] ERROR: SQL Server did not become ready after $((MAX_RETRIES * RETRY_INTERVAL)) seconds."
        exit 1
    fi
    echo "[entrypoint] SQL Server not ready yet... retry ${RETRIES}/${MAX_RETRIES}"
    sleep ${RETRY_INTERVAL}
done

echo "[entrypoint] SQL Server is ready."

# Run all SQL scripts in alphabetical order
for script in ${SCRIPTS_DIR}/*.sql; do
    if [ -f "${script}" ]; then
        echo "[entrypoint] Executing $(basename ${script})..."
        ${SQLCMD} -S localhost -U sa -P "${SA_PASSWORD}" -C -i "${script}"
        if [ $? -eq 0 ]; then
            echo "[entrypoint] $(basename ${script}) completed successfully."
        else
            echo "[entrypoint] ERROR: $(basename ${script}) failed."
            exit 1
        fi
    fi
done

echo "[entrypoint] All scripts executed. Database is ready."

# Keep the container running by waiting on the SQL Server process
wait ${SQL_PID}
