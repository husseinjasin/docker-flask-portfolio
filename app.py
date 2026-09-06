from flask import Flask 
from redis import Redis

app = Flask(__name__)

redis_client =  Redis (host="redis", port=6379)

@app.route("/")
def home ():
    redis_client.incr("visits")
    return "Hello from my Docker application, this is edition 2 !"
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
    
