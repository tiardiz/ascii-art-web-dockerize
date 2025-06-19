# ASCII-ART-WEB-DOCKERIZE

## 🖋 Description

**ASCII-ART-WEB-DOCKERIZE** is a containerized Go web application that serves ASCII art over HTTP.  
It is a continuation of earlier ASCII art web projects, now enhanced with full **Docker support**, following best practices for image building and container management.

This project focuses on:
- Clean web server structure using Go standard library only
- Multi-stage Docker builds for minimal image size
- Metadata labeling of Docker objects
- Garbage collection awareness (removing unused containers/images)

---

## 📚 Project Objectives

According to the task:

- ✅ Create a web server in Go
- ✅ Follow Go best practices
- ✅ Create at least:
  - one `Dockerfile`
  - one Docker **image**
  - one Docker **container**
- ✅ Apply metadata to Docker objects
- ✅ Be aware of unused Docker objects (aka "garbage collection")

---

## 👥 Authors

- Ardak Tleules @artleules  
- Malika Sadulayeva  @msadulay  
- Zumrad Yeshmuratova @ztalgatk

---

## 🚀 Usage: Run with Docker

### 🐳 Prerequisites
- Docker must be installed and running

### ▶️ Build and run using script
```bash
chmod +x run.sh
./run.sh
