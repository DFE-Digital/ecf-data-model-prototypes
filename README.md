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

* Northern Teaching School Hub
* Southern Induction Panel

### Delivery Partners

* Excellence Trust
* Greatest Education Institute
* Ultimate Academy Group

### Lead Providers

* AI
* BPN
* TF

### Schools

* Springfield Elementary
* Grange Hill
* Hogwarts

### People

#### ECTs

* Ebony
  - has been at at **Springfield Elementary** since **2021-07-09**
* Edward
  - has been at at **Grange Hill** since **2022-06-04**
  - has been mentored by **Michael** since **2022-09-12**
* Elsa
* Erica

#### Mentors

* Mary
* Michael
  - was at **Springfield Elementary** from **2012-11-24** until **2022-04-08**
  - has been at at **Grange Hill** since **2022-05-20**
  - has been mentoring **Edward** since **2022-09-12**

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
