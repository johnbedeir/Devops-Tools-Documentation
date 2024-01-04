import os
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World! This is a Flask app running on GCP Cloud Run.'

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    app.run(host='0.0.0.0', port=port, debug=True)
