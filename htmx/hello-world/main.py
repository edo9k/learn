from fastapi import FastAPI
from fastapi.responses import FileResponse
from fastapi.middleware.cors import CORSMiddleware
from ariadne import gql, QueryType, make_executable_schema
from ariadne.asgi import GraphQL

import sqlite3

app = FastAPI()

# Enable CORS (Cross-Origin Resource Sharing)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# GraphQL schema
type_defs = gql(
    """
    type Person {
        id: ID!
        name: String!
        age: Int!
        city: String!
    }

    type Query {
        people: [Person!]!
    }
"""
)

query = QueryType()

# Resolver for the "people" query
@query.field("people")
def resolve_people(_, info):
    conn = sqlite3.connect("people.db")
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM people")
    people = [
        {"id": row[0], "name": row[1], "age": row[2], "city": row[3]}
        for row in cursor.fetchall()
    ]
    conn.close()
    return people


# Create executable GraphQL schema
schema = make_executable_schema(type_defs, query)

# Mount the GraphQL app using the GraphQL class from ariadne
app.add_route("/graphql", GraphQL(schema=schema))

# Serve the HTML file
@app.get("/")
async def read_root():
    return FileResponse("index.html")


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="127.0.0.1", port=8000, debug=True)
