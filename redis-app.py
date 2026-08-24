import os
from flask import Flask
import redis

app = Flask(__name__)

redis_host = os.environ.get('REDIS_HOST', 'redis')
redis_port = int(os.environ.get('REDIS_PORT', 6379))

r = redis.Redis(host=redis_host, port=redis_port, decode_responses=True)

@app.route('/')
def welcome():
    return "Welcome to the Flask-Redis app!"

@app.route('/count')
def count():
    visits = r.incr('visits')
    return f"This page has been visited {visits} times."

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)