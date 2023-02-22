from flask import Flask, render_template, request, jsonify


from flask.ext.mysql import MySQL

from pymongo import MongoClient
client = MongoClient('mongodb+srv://sparta:test@cluster0.ljwbkl5.mongodb.net/?retryWrites=true&w=majority')
db = client.dbsparta

mysql = MySQL()
app = Flask(__name__)

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'sparta'
app.config['MYSQL_DATABASE_PASSWORD'] = 'qwer12#$'
app.config['MYSQL_DATABASE_DB'] = 'sparta'
app.config['MYSQL_DATABASE_PORT'] = '3360'
app.config['MYSQL_DATABASE_HOST'] = 'sparta-mydb-0.sparta-mydb.sparta'
mysql.init_app(app)



@app.route('/')
def home():
    return render_template('index.html')


@app.route("/bucket", methods=["POST"])
def bucket_post():
    bucket_receive = request.form['bucket_give']
    print("리시브",bucket_receive)
    doc = {
        'bucket' : bucket_receive
    }
    db.myBucket.insert_one(doc)
    return jsonify({'msg': '🥰 버킷리스트가 저장되었습니다!'})
    

@app.route("/bucket", methods=["GET"])
def bucket_get():
    bucket_list = list(db.myBucket.find({}, {'_id': False}))
    return jsonify({'bucket_list': bucket_list})
    


if __name__ == '__main__':
    app.run('0.0.0.0', port=5001, debug=True)