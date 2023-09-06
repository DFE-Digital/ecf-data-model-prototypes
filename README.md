# CPD data prototypes

This is a set of data model prototypes that we intend to test out. They will be used to inform the next steps for the CPD programme's data schema, whether that is a rewrite or heavy refactor.

We're not going to worry about actually building apps, APIs or real data. The aim is to test the model and we can do that with SQL. If the queries needed to serve our API endpoints are straightforward, as in they can be written using where clauses and joins, we can be confident they will translate to [ActiveRecord](https://guides.rubyonrails.org/active_record_basics.html) nicely. If we need to use common table expressions, window queries or other advanced techniques are needed, we'd probably end up having to hardcode SQL which is one of the things we're trying to move away from.

## How it works

Each prototype will:

* be stored in its own directory; currently there are three: [Flat](#flat), [Separate](#separate) and [Hierarchical](#hierarchical).
* be responsible for creating and replacing its own database with the naming structure `prototype_{variant}`
* be able to be created and refreshed using `make`
* import its own version of the data outlined in [the data section](#data)

What we need to work out:

* we need to come up with a format for the writing scenarios in a way we can
  test and compare them
* how do we summarise the results of multiple prototypes in an easily digestible way?

## Setup

You will need:

* PostgreSQL running locally with an admin account
* [GNU make](https://www.gnu.org/software/make/)
* [Mermerd](https://github.com/KarnerTh/mermerd) to generate the [Mermaid](https://mermaid.js.org/) ERD diagrams

## Data

The same data will be expressed in each of the prototypes so queries can be directly compared.

### Appropriate Bodies

* Appropriate Body A
  - was appointed to **ECT A** on **2023-11-16**
* Appropriate Body B
  - was appointed to **ECT C** on **2022-10-24**

### Delivery Partners

* Delivery Partner A
* Delivery Partner B
* Delivery Partner C

### Lead Providers

* Lead Provider A
* Lead Provider B

### Schools

* School A
* School B
* School C

### People

* ECT A
  - at **School A** from **2022-09-11** until present
  - being mentored by **Mentor A** since **2022-11-13**
  - has an open induction period with **Mentor A** and **Appropriate Body A** since **2023-11-16**
* ECT B
  - at **School A** from **2020-02-24** until present
  - being mentored by **Mentor A** since **2022-10-24**
* ECT C
  - at **School A** from **2018-04-30** until **2019-07-12**
  - at **School B** from **2021-07-13** until present
  - has an open induction period with **Mentor B** and **Appropriate Body B** since **2022-10-24**
* ECT D
* Mentor A
  - at **School A** from **2012-11-24** until present
  - mentoring **ECT A** since **2022-11-13**
  - mentoring **ECT B** since **2020-02-24**
* Mentor B
  - at **School B** from **2020-05-01** until present
  - mentoring **ETC C** since **2022-10-24**

## Prototypes

### Flat

```mermaid

erDiagram
    appropriate_bodies {
        integer id PK
        character_varying name
    }

    delivery_partners {
        integer id PK
        character_varying name
    }

    induction_periods {
        integer appropriate_body_id FK
        date finished_on
        integer id PK
        integer mentor_id FK
        integer registration_id FK
        date started_on
    }

    lead_providers {
        integer id PK
        character_varying name
    }

    people {
        integer id PK
        character_varying name
    }

    registrations {
        date finished_on
        integer funding_school_id FK
        integer id PK
        integer person_id FK
        date started_on
    }

    schools {
        integer id PK
        character_varying name
    }

    training_periods {
        integer delivery_partner_id FK
        date finished_on
        integer id PK
        integer lead_provider_id FK
        integer registration_id FK
        date started_on
    }

    induction_periods }o--|| appropriate_bodies : "appropriate_body_id"
    training_periods }o--|| delivery_partners : "delivery_partner_id"
    induction_periods }o--|| people : "mentor_id"
    induction_periods }o--|| registrations : "registration_id"
    training_periods }o--|| lead_providers : "lead_provider_id"
    registrations }o--|| people : "person_id"
    registrations }o--|| schools : "funding_school_id"
    training_periods }o--|| registrations : "registration_id"
```

### Hierarchical

```mermaid
erDiagram
    appropriate_bodies {
        character_varying id PK
        character_varying name
    }

    delivery_partners {
        character_varying id PK
        character_varying name
    }

    induction_periods {
        character_varying appropriate_body_id FK
        date finished_on
        character_varying id PK
        character_varying mentorship_id FK
        date started_on
    }

    lead_providers {
        character_varying id PK
        character_varying name
    }

    mentorships {
        date finished_on
        character_varying id PK
        character_varying mentee_id FK
        character_varying mentor_id FK
        date started_on
    }

    people {
        character_varying id PK
        character_varying name
    }

    schools {
        character_varying id PK
        character_varying name
    }

    tenureships {
        date finished_on
        character_varying id PK
        character_varying person_id FK
        character_varying school_id FK
        date started_on
    }

    training_periods {
        character_varying delivery_partner_id FK
        date finished_on
        character_varying id PK
        character_varying lead_provider_id FK
        character_varying mentorship_id FK
        date started_on
    }

    induction_periods }o--|| appropriate_bodies : "appropriate_body_id"
    training_periods }o--|| delivery_partners : "delivery_partner_id"
    induction_periods }o--|| mentorships : "mentorship_id"
    training_periods }o--|| lead_providers : "lead_provider_id"
    mentorships }o--|| tenureships : "mentee_id"
    mentorships }o--|| tenureships : "mentor_id"
    training_periods }o--|| mentorships : "mentorship_id"
    tenureships }o--|| people : "person_id"
    tenureships }o--|| schools : "school_id"
```

### Separate

```mermaid
erDiagram
    appropriate_bodies {
        integer id PK
        character_varying name
    }

    appropriate_body_appointments {
        integer appropriate_body_id FK
        integer id PK
        integer person_id FK
    }

    delivery_partner_associations {
        integer delivery_partner_id FK
        integer id PK
        integer person_id FK
    }

    delivery_partners {
        integer id PK
        character_varying name
    }

    lead_provider_associations {
        integer id PK
        integer lead_provider_id FK
        integer person_id FK
    }

    lead_providers {
        integer id PK
        character_varying name
    }

    mentorships {
        date finished_on
        integer id PK
        integer mentee_id FK
        integer mentor_id FK
        date started_on
    }

    people {
        integer id PK
        character_varying name
    }

    schools {
        integer id PK
        character_varying name
    }

    tenureships {
        date finished_on
        integer id PK
        integer person_id FK
        integer school_id FK
        date started_on
    }

    appropriate_body_appointments }o--|| appropriate_bodies : "appropriate_body_id"
    appropriate_body_appointments }o--|| people : "person_id"
    delivery_partner_associations }o--|| delivery_partners : "delivery_partner_id"
    delivery_partner_associations }o--|| people : "person_id"
    lead_provider_associations }o--|| lead_providers : "lead_provider_id"
    lead_provider_associations }o--|| people : "person_id"
    mentorships }o--|| tenureships : "mentee_id"
    mentorships }o--|| tenureships : "mentor_id"
    tenureships }o--|| people : "person_id"
    tenureships }o--|| schools : "school_id"
```
