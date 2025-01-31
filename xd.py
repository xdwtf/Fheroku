import os
from flask import Flask, jsonify, request 
app = Flask(__name__)

@app.route('/')
def hello_world():
    return jsonify({'message': 'hello world'})

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=os.environ.get('PORT', 8080))
