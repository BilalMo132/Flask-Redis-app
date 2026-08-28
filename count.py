from flask import Flask
import redis

app = Flask(__name__)

r = redis.Redis(host='redis_host', port=6379,)

@app.route('/')
def welcome():
    return "Welcome to my Flask-Redis app!"

@app.route('/count')
def count():
    count = r.incr('visits')
    return f"This page has been visited {count} times."

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)