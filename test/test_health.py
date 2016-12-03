import requests


def test_health():
    response = requests.get('http://app')

    assert response.status_code == 200

    data = response.json()

    assert data['status'] == 'ok'
