**GitHub Repository URL:** [https://github.com/UanAguilar/Campus-Event-System](https://github.com/UanAguilar/Campus-Event-System)    
## Task 1: Requirements Analysis & Prompt Architecture


### 1. RCTC Prompt Used
```text
[ROLE]
You are a Lead Systems Architect and Senior Full-Stack Engineer with extensive experience in rapid prototyping and agile system design for time-constrained hackathons.


[CONTEXT]
Our team of three is tasked with building a working prototype for an Online Campus Event Management System within a strict 3-hour time window. The system must support core features: students viewing upcoming campus events and registering for them, and administrators viewing the list of registered attendees.


[TASK]
Provide a streamlined, high-level system design architecture for this web application. Your output must include:
1. A minimal tech stack recommendation optimized for zero-config setup and rapid CRUD implementation.
2. A high-level database schema (Events and Registrations) and data flow description.
3. A sequential 3-hour implementation roadmap broken down into 60-minute milestones for a 3-person team.


[CONSTRAINTS]
* Do not recommend complex microservices, external message brokers, or heavy enterprise boilerplate.
* Do not use third-party state management libraries or heavyweight ORMs that require extensive configuration.
* Keep all architectural recommendations strictly limited to tools that can be initialized locally in under 5 minutes.
```


### 2. AI-Generated Architecture Output
```text
Minimal Tech Stack: Vanilla HTML5/CSS3/JavaScript (with Tailwind CSS via CDN), Node.js with Express.js backend, and SQLite for zero-config local persistence.


Database Schema & Data Flow:


Events table (id, title, description, date, location, capacity) and Registrations table (id, event_id, student_name, student_email, registered_at).


Students send a POST request to register, while admins query the Registrations table filtered by event ID.


3-Hour Implementation Roadmap (3-Person Team):


Hour 1: Environment setup, DB schema initialization, and basic frontend layouts (catalog & admin dashboard).


Hour 2: Implementing REST API endpoints (GET /events, POST /register, GET /admin/attendees) and connecting frontend forms.


Hour 3: Seeding mock data, end-to-end testing of the registration flow, and final UI polish.
```


### 3. Manual Grounding Evaluation


```text
The simplified prompt successfully guided the AI to strip away heavy engineering words while keeping the core architecture solid. The resulting plan is highly realistic for a 3 hour team prototype because it avoids complex setup steps and keeps the data structure down to the absolute essentials. This allows a three-person student team to immediately divide tasks and build a working MVP without getting bogged down in configuration.

```
```mermaid
erDiagram
    Users ||--o{ Registrations : registers
    Events ||--o{ Registrations : contains

    Users {
        int id PK
        string full_name
        string email UK
        string created_at
    }

    Events {
        int id PK
        string title
        string description
        string date
        string location
        int capacity
    }

    Registrations {
        int id PK
        int event_id FK
        int user_id FK
        string student_name
        string student_email
        string registered_at
    }

    ## Task 3: Database Design & ERD Generation
* **Relational Schema:** Designed in 3rd Normal Form (3NF) encompassing `Users`, `Events`, and `Registrations` entities.
* **DDL Implementation:** The production-grade SQL script with foreign key constraints and performance indexes is located at `/database/schema.sql`.

## Task 4: Shift-Left Testing & Security Refactoring
* **Vulnerability Addressed:** The legacy code was vulnerable to SQL Injection and resource leaks.
* **Refactored Code Location:** Saved at `/backend/RegistrationService.cs`.
* **Security Controls Applied:** Implemented parameterized SQL queries (`@Email`) to neutralize injection vectors and wrapped `SqlConnection` and `SqlCommand` instances inside C# `using` blocks to guarantee immediate disposal and prevent memory leaks.

## Task 5: Group Integration & Verification Report

### 1. Team Roster & Roles
* **Member 1 (Systems Architect & Prompt Lead):** Task 1 (Requirements Analysis) & Task 5 (Documentation).
* **Member 2 (Frontend Engineer):** Task 2 (AI-Assisted UI & WCAG Accessibility).
* **Member 3 (Database & Backend Engineer):** Task 3 (3NF Schemas & SQL Scripts) & Task 4 (Security Refactoring).

### 2. Setup Instructions
1. Clone the repository locally: `git clone https://github.com/UanAguilar/Campus-Event-System.git`
2. Open the project folder in VS Code.
3. View the user interface by opening `/frontend/index.html` in a web browser.
4. Execute `/database/schema.sql` in SQL Server to provision tables and constraints.

### 3. AI Disclosure Statement
Our team leveraged generative AI to assist with drafting prompts, mapping relational 3NF layouts to Mermaid syntax, and suggesting initial structural patterns. All generated outputs were rigorously reviewed, tested, and manually refactored by team members for security and accessibility compliance.

### 4. Group Verification Log Table

| Task # | Identified AI Flaw / Limitation | Manual Correction Applied | Member Responsible |
| :--- | :--- | :--- | :--- |
| Task 2 | Missing explicit `aria-label` attributes on modal and form fields | Manually integrated explicit WCAG POUR-compliant labels and aria attributes | Member 2 |
| Task 3 | AI-generated SQL script omitted foreign key indexing | Added explicit `CREATE NONCLUSTERED INDEX` DDL commands for performance | Member 3 |
| Task 4 | Suggested refactored code omitted proper connection closing | Wrapped `SqlConnection` and `SqlCommand` objects in C# `using` blocks to prevent resource leaks | Member 3 |
