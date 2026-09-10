from app import app, redis_client

def test_home():
    client = app.test_client()
    response = client.get("/")
    assert response.status_code == 200
    assert response.data == b"Hello from my Docker application, this is edition 2 !"

def test_visits():
    client = app.test_client()
    before = redis_client.get("visits")
    
    if before is None:
        before = b"0"    
   
    response = client.get("/")
    visits = redis_client.get("visits")
    assert visits is not None
    assert int(visits) == int(before) + 1
