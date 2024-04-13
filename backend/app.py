from flask import Flask
from flask_restx import Api, Resource
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

api = Api(app, version='1.0', title='Sample API',
          description='A simple API')

ns = api.namespace('api', description='API operations')

@ns.route('/hello')
class HelloWorld(Resource):
    def get(self):
        """Return a simple message"""
        return {'message': 'Hello, World!'}

if __name__ == '__main__':
    app.run(debug=True)