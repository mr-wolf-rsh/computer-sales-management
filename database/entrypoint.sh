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
SA_PASSWORD="${MSSQL_SA_PASSWORD}"

if [ -z "${SA_PASSWORD}" ]; then
    echo "[ERROR] MSSQL_SA_PASSWORD is not set. Check your .env file."
    exit 1
fi

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

# Run schema and stored procedure scripts (always safe to re-run: IF NOT EXISTS / CREATE OR ALTER)
for script in ${SCRIPTS_DIR}/*.sql; do
    if [ -f "${script}" ]; then
        BASENAME=$(basename "${script}")

        # Skip seed data if the Computers table already has rows
        if [ "${BASENAME}" = "03-seed-data.sql" ]; then
            EXISTING=$(${SQLCMD} -S localhost -U sa -P "${SA_PASSWORD}" -C -d CompuPalace \
                -Q "SET NOCOUNT ON; SELECT COUNT(*) FROM Computers" -h -1 2>/dev/null | tr -d '[:space:]')
            if [ "$EXISTING" -gt "0" ] 2>/dev/null; then
                echo "[entrypoint] Database already seeded (${EXISTING} computers). Skipping ${BASENAME}."
                continue
            fi
        fi

        echo "[entrypoint] Executing ${BASENAME}..."
        ${SQLCMD} -S localhost -U sa -P "${SA_PASSWORD}" -C -i "${script}"
        if [ $? -eq 0 ]; then
            echo "[entrypoint] ${BASENAME} completed successfully."
        else
            echo "[entrypoint] ERROR: ${BASENAME} failed."
            exit 1
        fi
    fi
done

echo "[entrypoint] All scripts executed. Database is ready."

# Keep the container running by waiting on the SQL Server process
wait ${SQL_PID}
