# Inception
![image](https://github.com/user-attachments/assets/c7a1a6ac-ae6f-4dab-a306-0ae480f70b10)

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Containers and Configuration](#containers-and-configuration)
- [Project Structure](#project-structure)
- [Reference](#reference)

---

## Introduction

Inception is a Docker-based project where the goal is to create a secure web infrastructure consisting of NGINX, WordPress, and MariaDB, each running in its own container. This project, part of the Ecole 42 curriculum, teaches fundamental concepts of system administration, containerization, and networking.

---

## Features

- Multi-container Docker setup for a complete web service stack.
- Secure NGINX configuration with SSL support.
- Persistent data storage using Docker volumes for MariaDB and WordPress.
- Network isolation between containers for added security.

---

## Installation

```bash
git clone https://github.com/yourusername/inception.git
cd inception
make
```

---

## Containers and Configuration

- **NGINX** - Acts as a web server and reverse proxy with SSL support for secure connections.
- **MariaDB** - Provides a MySQL-compatible database backend for WordPress.
- **WordPress** - Content management system connected to MariaDB for dynamic content.

---

## Project Structure

```
inception/
│
├── Makefile                 
└── srcs/
    ├── docker-compose.yml  
    ├── .env                 
    └── requirements/
        ├── mariadb/
        │   ├── Dockerfile
        │   ├── tools/
        │   └── conf/
        ├── nginx/
        │   ├── Dockerfile   
        │   └── conf/
        └── wordpress/
            ├── Dockerfile
            ├── tools/
            └── conf/
```

---

## Reference

- https://tuto.grademe.fr/inception/

---
