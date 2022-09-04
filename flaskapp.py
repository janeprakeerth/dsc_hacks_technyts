from flask import Flask,render_template
import joblib
import random

app = Flask(__name__)

with open('model_tree','rb') as file:
    model = joblib.load(file)


@app.route('/')
@app.route('/api')
def mlmodel():
    data =[]
    for i in range(404):
        data.append(random.randint(0,1))
    return list(model.predict([data]))
    
if __name__ == "__main__":
    app.run()