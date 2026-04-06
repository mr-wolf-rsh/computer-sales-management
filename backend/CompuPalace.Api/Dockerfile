FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["CompuPalace.Api/CompuPalace.Api.csproj", "CompuPalace.Api/"]
COPY ["CompuPalace.Application/CompuPalace.Application.csproj", "CompuPalace.Application/"]
COPY ["CompuPalace.Domain/CompuPalace.Domain.csproj", "CompuPalace.Domain/"]
COPY ["CompuPalace.Infrastructure/CompuPalace.Infrastructure.csproj", "CompuPalace.Infrastructure/"]
RUN dotnet restore "CompuPalace.Api/CompuPalace.Api.csproj"

COPY . .
WORKDIR "/src/CompuPalace.Api"
RUN dotnet publish "CompuPalace.Api.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
EXPOSE 5000
ENV ASPNETCORE_URLS=http://+:5000
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "CompuPalace.Api.dll"]
