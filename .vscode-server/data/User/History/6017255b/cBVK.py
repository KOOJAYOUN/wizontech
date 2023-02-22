db = {
    'user'     : 'sparta',
    'password' : 'qwer12#$',
    'host'     : 'sparta-mydb-0.sparta-mydb.sparta',
    'port'     : '3306',
    'database' : 'sparta'
}

DB_URL = f"mysql+mysqlconnector://{db['user']}:{db['password']}@{db['host']}:{db['port']}/{db['database']}?charset=utf8" 