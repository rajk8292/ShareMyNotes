# 📚 ShareMyNotes

A simple, fast, and student‑friendly notes sharing platform. Upload class notes, categorize them by course/semester/subject, search and download, and let admins keep everything tidy.

> **Stack (default):** Java 17, Spring Boot 3, Spring Web, Spring Data JPA, Spring , Thymeleaf, Bootstrap 5, MySQL 8.
> Frontend is rendered via Thymeleaf templates.

---

## ✨ Features

* 👤 **Auth**: Register/Login (email + password), role‑based access (Teacher/student)
* 🗂️ **Organized Notes**: Course → Semester/Branch → Subject categories
* ⬆️ **Upload**: PDF/Images with title, description, 
* 🔎 **Search & Filters**: Keyword, subject, uploader, date
* 🛡️ **Admin Panel**: manage notes, manage students

---

## 🧱 Architecture (High‑Level)

```
[Browser]
   │  HTTP
   ▼
[Spring Boot MVC]
   ├── Controllers (Web/API)
   ├── Services (Business rules)
   ├── Repositories (JPA/Hibernate)
   └── Thymeleaf Views (Bootstrap UI)
        │
        ▼
     [MySQL DB]
```

---

## 🧰 Tech Stack

* **Backend**: Java 17, Spring Boot 3, Spring Web, JPA/Hibernate, Validation
* **View**: Thymeleaf + Bootstrap 5
* **DB**: MySQL 8 
* **Build**: Maven

---

## 🗂️ Project Structure (sample)

```
ShareMyNotes/
├─ src/main/java/com/app/sharemynotes/
│  ├─ controller/
│  ├─ service/
│  ├─ repository/
│  ├─ model/
│  ├─ config/
│  └─ ShareMyNotesApplication.java
├─ src/main/resources/
│  ├─ templates/ (Thymeleaf)
│  │  ├─ admin/
│  │  └─ student/
│  ├─ static/ (css, js, images)
│  └─ application.properties
├─ uploads/ (local storage)
├─ pom.xml
└─ README.md
```

---

## 🚀 Getting Started

### 1) Prerequisites

* Java 17+
* Maven 3.9+
* MySQL 8+

### 2) Database Setup

Create a database:

```sql
CREATE DATABASE sharemynotes CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### 3) Configure `application.properties`

```properties
# Server
server.port=8080

# DB
spring.datasource.url=jdbc:mysql://localhost:3306/sharemynotes?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true
spring.datasource.username=YOUR_DB_USER
spring.datasource.password=YOUR_DB_PASS
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true

# File storage (local)
app.upload.dir=uploads
app.max-file-size=20MB

# Optional: Security (enable if you add Spring Security)
# spring.security.user.name=admin
# spring.security.user.password=admin123
```

### 4) Run the App

```bash
mvn spring-boot:run
# or
mvn clean package && java -jar target/sharemynotes-*.jar
```

Open: [http://localhost:8080](http://localhost:8182)

### 5) Seed an Admin (example)

If you use a custom `users` table with roles, seed one user:

```sql
INSERT INTO users (name, email, password, role, enabled)
VALUES ('Admin', 'admin@smn.local', '$2a$10$REPLACE_WITH_BCRYPT', 'ADMIN', true);
```

## 🧪 Test Users
* `admin@example.com` / `admin@123`

> Add them via SQL/migration according to your schema.

---

## 📦 Build & Deployment

### Render / Railway (Jar deployment)

1. Generate JAR: `mvn -q -DskipTests package`
2. Set env vars in the dashboard:

   * `JAVA_VERSION=17`
   * `SPRING_PROFILES_ACTIVE=prod` (optional)
   * `DB_*` for credentials or a full `spring.datasource.url`
3. Start command: `java -jar target/sharemynotes-*.jar`

### MySQL in Cloud

* Provide a public connection string & credentials.
* Update `application.properties` via env overrides.

### Static Assets

* Thymeleaf + Bootstrap ships from `src/main/resources/static`.

---

## 🖼️ Screenshots

| Home                               | Notes List                         | Upload                                 | Admin                                |
| ---------------------------------- | ---------------------------------- | -------------------------------------- | ------------------------------------ |
|https://github.com/rajk8292/ShareMyNotes/blob/main/src/main/resources/static/img/Screenshot%202025-08-28%20113859.png | ![List](docs/screenshots/list.png) | ![Upload](docs/screenshots/upload.png) | ![Admin](docs/screenshots/admin.png) |
---

## 🤝 Contributing

1. Fork the repo
2. Create a feature branch: `git checkout -b feat/your-feature`
3. Commit changes: `git commit -m "feat: add your feature"`
4. Push: `git push origin feat/your-feature`
5. Open a Pull Request

---

## 📫 Contact

* **Author:** (Rajkumar Gupta)
* **Email:** (mailto:kumarguptaraj825@gmail.com)
* **Project:**(https://github.com/raj8292/ShareMyNotes)
