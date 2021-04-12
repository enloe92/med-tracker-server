# Med Tracker API Documentation (Node.js/Express/Postgres)

## Introduction

Hello!

Med Tracker's API is a REST API built using Node.js accompanied with Express/Knex(Postgres)
that is used to:

A) Store Users notes for their medications
B) Users can also search other User's notes, to help with charing side effects etc.
C) Users can add searched rules to their collections

### Technology Used

1) Node.js - Express
2) Postgres - Knex used for SQL/Javascript integration

### To Install Locally

1) Clone github repo to your machine
2) Run command 'npm install' to install dependencies locally
3) Run command 'npm run dev' to start up server locally

## API Documentation

### Authorization

Every API request will require a 'bearer ' token created by the json web token library,
there are no elements that does not require authoriztion of a signin.  2 dummy accounts have
been provided in the seed file.  If using postman or any other third party libray to put the
bearer token in the "Authorization" field

No API key required for access

### Responses

All GET requests will return JSON data of items listed in the associated endpoints (see further down),
POST of a new rule will also return a JSON version of that Rule (again, format will be listed below).

PATCH and DELETE will not return anything more that the associate status code listed at the bottom of
documentation

All Errors will return as follows:

{
  error: {Message: `this would be the message`}
}


### Endpoints

#### Auth Endpoints

```
POST /api/auth/login
```

For User authentication upon login

| Body Key    | Type        | Description |
| ----------- | ----------- | ----------- |
| user_name   | string      | Required. User username |
| password    | string      | Required. User password |

#### Users Endpoints

```
POST /api/users
```

For User account creation.  There are checks on password requirements and if the user_name is currently in
the database.  JSON Web Tokens are used to hash the password

| Body Key    | Type        | Description |
| ----------- | ----------- | ----------- |
| user_name   | string      | Required. User username |
| password    | string      | Required. User password |

#### Games Endpoints

The User currently cannot POST types of medication, all of that comes from what is already in the database
The user will get the notes 1 of 3 ways, all notes will output in the following format:

```json
[
  {
    "id": "int",
    "game_name": "string"
  }
]
```

There are 3 GET requests:

```
GET /api/games/all
```

As the title suggests, returns all medication types in the database

```
GET /api/games
```

This will return the user's medication types (user id required through middleware)

```
GET /api/games/:game_id
```

This will return one singular medication type based on id

### Rules Endpoints

The Rules endpoints utilize ALL CRUD functions, only GET and POST will return any JSON data
The rest will just return status codes based on endpoint.  JSON data will be returned as such:

```json
[
  {
    "id": "int",
    "game_id": "int",
    "game_name": "string",
    "rule_title": "string",
    "rule_descripion": "string",
    "assigned_user": "int"
  }
]
```

```
GET /api/rules
```

Returns all notes

```
GET /api/rules/games/:game_id
```

Returns all of the user's notes (user id obtained through middleware) for the specific medication type

```
GET /api/rules/search/:game_id
```

The opposite of the last GET, this returns all medication types that are NOT assigned to the user

```
POST /api/rules
```

This will create a new user note.  user_id and game_id for assigning obtained through middleware
will also manually to the join table for medication types assigned to that user

| Body Key    | Type        | Description |
| ----------- | ----------- | ----------- |
| rule_title  | string      | Title for the rule|
| rule_description    | string      | Required. The actual rule itself |

```
PATCH /api/rules/:rule_id
```

Has same requirements as above but for updating the user's notes for tweaks

```
DELETE /api/rules/:rule_id
```

Removes the note

*note, DELETE and PATCH require that the user's id matches the rule's assigned user*

### Status Codes

Right Routine returns the following status codes in its API:

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 201 | `CREATED` |
| 204 | `NO CONTENT` |
| 400 | `BAD REQUEST` |
| 404 | `NOT FOUND` |
| 500 | `INTERNAL SERVER ERROR` |

