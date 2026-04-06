# 👑 Compu Palace -- Computer Sales Management

A full-stack web application for managing a computer inventory with royal-themed product naming, tiered badge system, and rich data visualization. Built with React, ASP.NET 8, and SQL Server 2022, fully containerized with Docker Compose.

## Tech Stack

| Layer          | Technology                                      |
| -------------- | ----------------------------------------------- |
| Frontend       | React 18 + TypeScript + Redux Toolkit + MUI 5   |
| Backend        | ASP.NET 8 Web API (C#) -- Clean Architecture    |
| Database       | SQL Server 2022 (Developer Edition)              |
| Infrastructure | Docker Compose                                   |
| Testing        | Vitest + React Testing Library / xUnit           |

## Screenshots

_Coming soon_

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

## Quick Start

```
cp .env.example .env
docker compose up --build
```

Or run **`rebuild.bat`** for a full clean rebuild.

| Service  | URL                              |
| -------- | -------------------------------- |
| Frontend | http://localhost:3000             |
| API      | http://localhost:5000/swagger     |
| Database | localhost:1433 (SA credentials)  |

Both frontend and backend containers run in **dev mode with hot reload** — edit code and see changes instantly without rebuilding. The database is pre-seeded with 100 computers, 16 processors, and 15 GPUs.

Environment variables are defined in `.env` (copied from `.env.example`).

## Architecture

The backend follows **Clean Architecture** with four layers:

- **CompuPalace.Domain** -- Entities, enums, value objects
- **CompuPalace.Application** -- DTOs, interfaces, service contracts
- **CompuPalace.Infrastructure** -- Data access, repositories, Unit of Work
- **CompuPalace.Api** -- Controllers, middleware, DI configuration

Key patterns:
- **Repository + Unit of Work** for data access
- **Stored procedures** for all CRUD operations, paginated search, and dashboard aggregation (7 total)
- **RTK Query** for frontend data fetching and caching
- **Vite dev proxy** forwards `/api` requests to the backend container, eliminating CORS in development
- **Container-Presentational** component pattern

## Features

- Full CRUD for computer inventory management
- Paginated data grid with search and filtering
- Royal tier badge system (Page, Squire, Knight, Baron, Duke, Prince, Sovereign)
- Product images with Unsplash URLs and live preview
- Price management and filtering
- Dashboard with charts and statistics (Recharts)
- Toggle between Royal Court (light) and Night Court (dark) themes
- CSV data export (file-saver)
- Side-by-side computer comparison with gold-highlighted best values per spec
- Keyboard shortcuts (`/` search, `n` new, `Esc` clear)
- Form validation with Zod + React Hook Form

## Tier Badge System

Each computer is assigned a royal tier based on a weighted score of its specs:

**Formula:** `Score = (RAM_MB / 1024) × 0.3 + (TotalStorageGB / 1000) × 0.2 + (Price / 200) × 0.3 + (PSU_Wattage / 100) × 0.2`

| Score Range | Tier      | Level       |
| ----------- | --------- | ----------- |
| < 3         | Page      | Entry       |
| 3 -- 4.99   | Squire    | Budget      |
| 5 -- 6.99   | Knight    | Mid-range   |
| 7 -- 8.99   | Baron     | Upper mid   |
| 9 -- 10.99  | Duke      | Performance |
| 11 -- 12.99 | Prince    | High-end    |
| >= 13       | Sovereign | Flagship    |

The tier is calculated server-side in `ComputerService` when mapping entities to DTOs.

## Project Structure

```
computer-sales-management/
├── docker-compose.yml
├── rebuild.bat
├── run-tests.bat
├── .env.example
├── .dockerignore
├── .gitattributes
├── .gitignore
├── README.md
├── database/
│   ├── Dockerfile
│   ├── entrypoint.sh
│   ├── 01-schema.sql
│   ├── 02-stored-procedures.sql
│   └── 03-seed-data.sql
├── backend/
│   ├── CompuPalace.sln
│   ├── CompuPalace.Domain/
│   │   ├── Entities/          (Computer, Processor, Gpu, StorageDrive, UsbPort)
│   │   └── Enums/             (StorageDriveType, WeightUnit)
│   ├── CompuPalace.Application/
│   │   ├── DTOs/              (ComputerDto, PaginatedResult, DashboardStatsDto, etc.)
│   │   ├── Interfaces/        (IComputerRepository, IUnitOfWork, etc.)
│   │   ├── Services/          (ComputerService with tier badge logic)
│   │   ├── Validators/        (FluentValidation rules)
│   │   └── Mappings/          (AutoMapper profiles)
│   ├── CompuPalace.Infrastructure/
│   │   ├── Data/              (AppDbContext, EF Core configurations)
│   │   └── Repositories/      (ComputerRepository, UnitOfWork, etc.)
│   ├── CompuPalace.Api/
│   │   ├── Dockerfile
│   │   ├── Controllers/       (Computers, Processors, Gpus)
│   │   ├── Middleware/        (ExceptionHandling, RequestLogging)
│   │   └── Properties/
│   └── CompuPalace.Tests/
│       └── Unit/              (Services, Validators)
└── frontend/
    ├── Dockerfile
    ├── package.json
    ├── vite.config.ts
    └── src/
        ├── app/               (Redux store, typed hooks)
        ├── theme/             (MUI themes, ThemeContext)
        ├── routes/            (AppRouter with lazy loading)
        └── features/
            ├── computers/
            │   ├── api/       (RTK Query API slice)
            │   ├── components/ (ComputerList, ComputerCard, ComputerForm, ComputerDetail, SearchBar)
            │   ├── hooks/     (useDebounce, useKeyboardShortcuts, useComputerFilters)
            │   ├── utils/     (csvExport, tierBadge)
            │   └── types/     (TypeScript interfaces)
            ├── dashboard/     (Dashboard with Recharts)
            ├── compare/       (CompareView)
            └── shared/
                ├── components/ (Layout, ConfirmDialog, LoadingSpinner, Pagination)
                └── utils/     (formatters)
```

## Database Schema

The database uses a normalized design with the following tables:

| Table           | Description                                        |
| --------------- | -------------------------------------------------- |
| `Processors`    | Lookup table for CPU models (Intel, AMD)           |
| `Gpus`          | Lookup table for GPU models (NVIDIA, AMD)          |
| `Computers`     | Main entity -- name, RAM, price, weight, PSU, etc. |
| `StorageDrives` | Child table -- multiple SSD/HDD drives per computer |
| `UsbPorts`      | Child table -- multiple USB port groups per computer |

Key constraints: cascading deletes on child tables, check constraints on enums (`WeightUnit`, `StorageType`, `UsbType`), unique indexes on processor/GPU names.

## API Endpoints

| Method   | Endpoint                      | Description                          |
| -------- | ----------------------------- | ------------------------------------ |
| `GET`    | `/api/computers`              | List computers (paginated)           |
| `GET`    | `/api/computers/{id}`         | Get computer by ID with full details |
| `POST`   | `/api/computers`              | Create a new computer                |
| `PUT`    | `/api/computers/{id}`         | Update an existing computer          |
| `DELETE` | `/api/computers/{id}`         | Delete a computer                    |
| `GET`    | `/api/computers/search`       | Search computers by name/specs       |
| `GET`    | `/api/processors`             | List all processors                  |
| `GET`    | `/api/gpus`                   | List all GPUs                        |
| `GET`    | `/api/computers/dashboard`    | Dashboard statistics                 |

## Running Tests

Run **`run-tests.bat`** to execute both backend and frontend tests with a summary report, or run them individually:

Backend: `cd backend && dotnet test`

Frontend: `cd frontend && npm test`

## Development

### Docker (recommended)

```
docker compose up --build
```

All three services start with proper dependency ordering. The frontend and backend containers support hot reload — file changes are detected automatically. The database initializes itself with schema, stored procedures, and seed data on first run.

### Running services individually

Database: `docker compose up db`

Backend: `cd backend && dotnet watch run --project CompuPalace.Api`

Frontend: `cd frontend && npm install && npm run dev`

### Environment Variables

Copy `.env.example` to `.env` before running. All variables are documented there.

| Variable                   | Description                          |
| -------------------------- | ------------------------------------ |
| `SA_PASSWORD`              | SQL Server SA password               |
| `ASPNETCORE_ENVIRONMENT`   | .NET environment                     |
| `MSSQL_PID`               | SQL Server edition (Developer)       |

## Acknowledgments

- Product images sourced from [Unsplash](https://unsplash.com/)

## License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0).

You may redistribute and/or modify this software under the terms of the GPL-3.0 as published by the Free Software Foundation. See [LICENSE](./LICENSE) in the repository root for the full license text.

If you contribute code, you agree that your contributions are provided under the same GPL-3.0 terms.
