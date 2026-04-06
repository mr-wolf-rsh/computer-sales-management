# =============================================================================
# Compu Palace - Backend (.NET 8 API) — Dev Mode
# =============================================================================
# Single-stage: runs dotnet watch with hot reload for local development.
# =============================================================================

FROM mcr.microsoft.com/dotnet/sdk:8.0

WORKDIR /src

# Copy csproj files first for layer caching on restore
COPY CompuPalace.Api/CompuPalace.Api.csproj CompuPalace.Api/
COPY CompuPalace.Application/CompuPalace.Application.csproj CompuPalace.Application/
COPY CompuPalace.Domain/CompuPalace.Domain.csproj CompuPalace.Domain/
COPY CompuPalace.Infrastructure/CompuPalace.Infrastructure.csproj CompuPalace.Infrastructure/
RUN dotnet restore CompuPalace.Api/CompuPalace.Api.csproj

# Copy the rest of the source
COPY . .

EXPOSE 5000

ENV ASPNETCORE_ENVIRONMENT=Development
ENV DOTNET_USE_POLLING_FILE_WATCHER=true

CMD ["dotnet", "watch", "run", "--project", "CompuPalace.Api", "--no-launch-profile"]
