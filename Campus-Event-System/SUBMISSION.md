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
