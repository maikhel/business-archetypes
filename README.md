# Archetype patterns

An example Rails application to present the usage of business archetype patterns.
Based on the book:
[Enterprise Patterns and MDA: Building Better Software with Archetype Patterns and UML](https://www.amazon.pl/Enterprise-Patterns-MDA-Building-Archetype/dp/032111230X)


## Installation

#### System dependencies:
- PostgreSQL
- ruby, 3.1.0

#### Setup
- clone repository
- install gems with `bundle install`
- create database and run migrations with `rails db:setup`


## Archetypes

See examples in the app/models and tests for them. For some archetypes there are also app/services.
There is also `erd.pdf` file with current models/tables structure.

### Party, Party Roles and Party Relationships

Scrum Team Example: 
- [without archetype](https://github.com/maikhel/business-archetypes/tree/v1.0-no-archetypes)
- [with archetype](https://github.com/maikhel/business-archetypes/tree/v1.1-relationship-archetype)

Supervision with responsibilities example:
- [without archetype](https://github.com/maikhel/business-archetypes/tree/add-responsibilities-no-arch)
- [with archetype](https://github.com/maikhel/business-archetypes/tree/more-supervisions)

### Product Archetype

Product and Product Type example: [branch product-archetype](https://github.com/maikhel/business-archetypes/tree/product-archetype)
