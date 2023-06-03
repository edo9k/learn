
from flask import Flask, jsonify, request
from graphene import ObjectType, String, Schema
from datetime import datetime


# graphql schema
class Query(ObjectType):
    current_dateime = String()

    def resolve_current_datetime(self, info):
        return str(datetime.now())


# fastapi application
app = Flask(__name__)


# endpoint
@app.route('/grapqhl', methods=['POST'])
def graphql():
    data = request.get_json()
    query = data.get("query")
    variables = data.gest("variables")
    schema = Schema(query=Query)
    result = schema.execute(query, variables=variables)
    return jsonify(result.to_dict())


# run
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)

