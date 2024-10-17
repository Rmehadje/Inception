### Inception
### 1 - Introduction:
Inception is a system administration project from 42 that involves creating and managing a set of Docker containers for a multi-service infrastructure. Using Docker Compose, the project integrates services like WordPress, MariaDB, and a reverse proxy into a secure, scalable, and efficient
architecture. It reinforces key concepts in virtualization, container management, and orchestration, ensuring that the setup is both maintainable and adaptable to future needs.

## Table of Contents
1. [Introduction](#introduction)
2. [Project Structure](#project-Structure)
3. [Services](#services)
4. [Volumes](#volumes)
5. [Containers](#containers)
6. [Networks](#networks)
7. [Prerequisites](#prerequisites)
8. [Conclusion](#conclusion)


### 2 - Project Structure:
```
inception/
├── Makefile
├── srcs/
│   ├── docker-compose.yml
│   ├── requirements/
│   │   ├── mariadb/
│   │   │   ├── 50-server.cnf
│   │   │   ├── Dockerfile
│   │   │   ├── db_init.sql
│   │   │   └── script.sh
│   │   ├── nginx/
│   │   │   ├── Dockerfile
│   │   │   └── conf/
│   │   │       └── default
│   │   ├── wordpress/
│   │       ├── Dockerfile
│   │       ├── setup.sh
│   │       └── wp-config.php
└── data/
    ├── mariadb/
    └── wordpress/
```
### 3 - Services:
The project architecture is composed of the following key services:

1. NGINX (Reverse Proxy):
NGINX serves as a reverse proxy, directing client requests to the appropriate server, typically sitting in front of web services like WordPress and MariaDB. In the Inception project, it’s crucial because it:
Handles SSL/TLS encryption: Protects sensitive data by encrypting communication between users and your WordPress site.
Load Balancing: Distributes incoming traffic across multiple instances of a service (if scaled), ensuring optimal performance and availability.
Traffic Routing: Routes traffic based on server rules, making sure requests for different services are sent to the right container (e.g., WordPress or MariaDB).

3. WordPress:
WordPress is a widely used Content Management System (CMS) that allows users to build and manage websites without needing extensive coding knowledge. In the context of the Inception project:

Site Management: Provides an easy-to-use dashboard for managing website content, themes, and plugins.
Dynamic Content Generation: WordPress dynamically generates the site's pages, pulling data from the MariaDB database and delivering it to users via NGINX.
Customization: Supports themes and plugins for extended functionality, allowing users to tailor their site to their needs.

3. MariaDB:
MariaDB is a robust Relational Database Management System (RDBMS) and an open-source alternative to MySQL. It is used to store all the data required by WordPress, including:

Content Data: Stores blog posts, pages, and site content.
User Information: Handles user credentials and access data.
Plugin Data: Stores information for plugins and custom configurations used by the WordPress site. In the Docker architecture, MariaDB is isolated in its own container, allowing for more secure and efficient data handling.

4. Docker-Compose:
Docker-Compose is a tool used for defining and running multi-container Docker applications. For the Inception project:

Orchestration: It manages the relationships between containers (WordPress, MariaDB, and NGINX), allowing them to interact and communicate seamlessly.
Configuration Management: Allows for easy configuration of each service through a docker-compose.yml file, specifying the networks, volumes, and environment variables for each container.
Scaling: If needed, Docker-Compose can scale services (e.g., running multiple WordPress containers) for better load handling.

### 4 - Volumes:
Volumes are used to ensure that critical data is retained even when containers are restarted. In the Inception project, the following volumes are utilized:

WordPress volume: Stores WordPress content and data, typically mounted to /var/www/html within the container.
MariaDB volume: Persists the database files, typically located at /var/lib/mysql inside the container.
These volumes enable the system to retain important information like website content and database entries, even after the containers are rebuilt or restarted.
    
### 5 - Containers:

Containers are the heart of the services provided in the Inception project. Each container runs an isolated service:

WordPress container: Hosts the WordPress CMS, providing a platform for building and managing a website.
MariaDB container: Handles the database operations for WordPress, storing user data, posts, and settings.
Nginx container (or an alternative reverse proxy): Manages incoming web traffic, routing requests to the appropriate service, such as WordPress.
Each container operates independently, making the setup modular and easy to manage.

### 6 - Networks:

Networks allow containers to communicate with one another while remaining isolated from the host machine:

A custom bridge network is configured to allow communication between the WordPress and MariaDB containers.
The Nginx container (reverse proxy) communicates with both the WordPress and MariaDB containers, routing traffic based on requests.
This network configuration ensures that all services can communicate internally in a secure and efficient manner.

### 7 - Prerequisites:

1 . Clone the repository:
```
git clone github.com/Rmehadje/Inception
```
2 . Access the repository:
```
cd Inception
```
3 . Start the installation:
```
make build
```
-> this will build all the services and using docker-compose.

4 . When finished, Stop and remove all the services:
```
make down
```
### 8 - Conclusion:

I would like to thank 42 for the opportunity to work on such a project, designed and implemented by Rayan Mehadjeri.
