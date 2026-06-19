# Laravel Docker Boilerplate

A ready-to-go, pre-configured Laravel 13 development environment running on PHP 8.5, MySQL 9.0, and phpMyAdmin. This repository contains the full framework setup alongside the Docker infrastructure.

## 🌐 Local Access Links
* **Laravel App:** [http://localhost:13000](http://localhost:13000)
* **phpMyAdmin:** [http://localhost:13001](http://localhost:13001)

---

## 🚀 Quick Start Guide

Follow these steps to spin up the existing project on any computer with Docker installed.

### 1. Clone the Repository
```bash
git clone https://github.com/Kartinov/laravel-docker-starter.git
cd laravel-docker-starter
```

### 2. Create Your Environment File
Copy the existing example file to create your local `.env` configuration:

```bash
cp .env.example .env
```

Open the newly created `.env` file and make sure the database settings look like this to match the internal Docker network:

```ini
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=root
```

### 3. Build and Start the Containers
Run this command to build your custom PHP image and start all services in the background:
Set your local user and group IDs first so Docker runs the app container with your permissions.

```bash
export APP_UID=$(id -u) && export APP_GID=$(id -g)
docker compose up -d --build
```

### 4. Install Composer Dependencies
Since the vendor folder is gitignored, download Laravel's dependencies inside the container:

```bash
docker compose exec app composer install
```

### 5. Generate Application Key
Generate the unique application security key required by Laravel:

```bash
docker compose exec app php artisan key:generate
```

### 6. Run Database Migrations
Build out your database tables:

```bash
docker compose exec app php artisan migrate
```

## 🧙‍♂️ Daily Commands Reference
Always run your development commands from your project root, using the `docker compose exec app` prefix to route them inside the PHP container.

* Start the environment: `docker compose up -d`
* Stop the environment: `docker compose down`
* Run Artisan commands: `docker compose exec app php artisan <command>`
* Run Composer commands: `docker compose exec app composer <command>`
* Run Database Seeders: `docker compose exec app php artisan db:seed`