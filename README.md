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

Environment variables are defined in `.env` (copied from `.env.example`).

## Architecture

The backend follows **Clean Architecture** with four layers:

- **CompuPalace.Domain** -- Entities, enums, value objects
- **CompuPalace.Application** -- DTOs, interfaces, service contracts
- **CompuPalace.Infrastructure** -- Data access, repositories, Unit of Work
- **CompuPalace.Api** -- Controllers, middleware, DI configuration

Key patterns:
- **Repository + Unit of Work** for data access
- **Stored procedures** for search and paginated queries
- **RTK Query** for frontend data fetching and caching
- **Container-Presentational** component pattern

## Features

- Full CRUD for computer inventory management
- Paginated data grid with search and filtering
- Royal tier badge system (Page, Squire, Knight, Baron, Duke, Prince, Sovereign)
- Product images with Unsplash URLs and live preview
- Price management and filtering
- Dashboard with charts and statistics (Recharts)
- Dark mode ("Night Court" theme)
- CSV data export (file-saver)
- Side-by-side computer comparison
- Keyboard shortcuts (`/` search, `n` new, `Esc` clear)
- Form validation with Zod + React Hook Form

## Project Structure

```
computer-sales-management/
├── docker-compose.yml
├── rebuild.bat
├── run-tests.bat
├── .env.example
├── .dockerignore
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
    ├── nginx.conf
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
            ├── compare/       (CompareView, compareSlice)
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

### Running services individually

Database: `docker compose up database`

Backend: `cd backend && dotnet run --project CompuPalace.Api`

Frontend: `cd frontend && npm install && npm run dev`

### Environment Variables

Copy `.env.example` to `.env` before running. All variables are documented there.

| Variable                   | Description                          |
| -------------------------- | ------------------------------------ |
| `SA_PASSWORD`              | SQL Server SA password               |
| `ASPNETCORE_ENVIRONMENT`   | .NET environment                     |
| `ASPNETCORE_URLS`          | Backend listen URL                   |
| `VITE_API_URL`             | API base URL for frontend            |

## License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0).

You may redistribute and/or modify this software under the terms of the GPL-3.0 as published by the Free Software Foundation. See [LICENSE](./LICENSE) in the repository root for the full license text.

If you contribute code, you agree that your contributions are provided under the same GPL-3.0 terms.
