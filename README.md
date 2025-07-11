# 🚀 FrankenPHP Laravel Template

A simple template for Laravel Project with FrankenPHP on docker-compose environment.
---

## 📦 Features


- **FrankenPHP + Caddy Integration**
  - Native support for HTTP/1.1, HTTP/2, and HTTP/3
  - Embedded PHP execution via Caddy web server
  - Automatic HTTPS (Let's Encrypt or ZeroSSL)
  - Runs your PHP app with a single binary – no extra dependencies!
  - Supports popular PHP extensions (OPcache, XDebug, etc.)

- **Dockerized Laravel**
  - Clean separation of application (`src/`) and infrastructure
  - Easy to get up and running with minimal configuration

---

## 🧰 Requirements

- Docker installed on your system

---


## ⚙️ Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/hattake89/frankenphp-laravel-template.git
cd frankenphp-laravel-template
```

### 2. Copy Laravel Project

Copy laravel project to src/ folder 

💡 You can also create a fresh Laravel app inside src/:
```bash
docker run --rm -v $(pwd)/src:/app laravelsail/php82-composer:latest composer create-project laravel/laravel .
```

### 3. Setup Environment

Copy file `.env.example` :

```bash
cp .env.example .env
php artisan key:generate
```

🔧 Modify .env as needed for your environment.

### 4. Build and Run the Server
Build and run application server :
```bash
docker-compose up -d --build
```

### 5. Booommmmmm
Wait a moment... then you're ready to go! 🎉

📄 License
MIT

🧑‍💻 Author
Created by @hattake89 – Contributions are welcome!