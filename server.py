## This uses repl.it, Before using this for your code make sure you know that

from flask import Flask, request
import random
from threading import Thread
from replit import db

app = Flask(__name__)
def find(code):
  found = False
  for i in db:
    print(i)
    if str(i[1]) == str(code):
      print(i)
      found = True
      return db.index(i)
  if found == False:
    return "None"

def gen():
  new = random.randint(10000,9999999)
  if find(new):
    return gen()
  else:
    return new

@app.route('/')
def page1():
  return ""

@app.route('/new')
def page2():
  new = gen()
  db.append(["", new])
  return str(new)

@app.route('/data/<code>', methods = ["GET", "POST"])
def page3(code):
  if find(code) == "None":
    return "Not found"
  else:
    index = find(code)
    if request.method == "GET":
      return db[find(code)][0]
    else:
      db[find(code)] = [request.form, code]
      return "Success"
  
# set website
def run():
    app.run(host="0.0.0.0", port=8080)

def keep_alive():
    server = Thread(target=run)
    server.start()
run()
keep_alive()
