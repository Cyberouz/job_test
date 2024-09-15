from flask import Flask, request

app = Flask("Hi Recruto")


@app.route('/')
def hello():
    name = request.args.get('name', 'Recruto')
    message = request.args.get('message', 'Давай дружить')

    return f"Hello {name}! {message}!"


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)