## This uses repl.it, Before using this for your code make sure you know that

from flask import Flask, request
import random
from threading import Thread
from replit import db
db = []
app = Flask(__name__)
def find(code):
  found = False
  for i in db:
    print(i)
    if str(i[1]) == str(code):
      found = True
      return db.index(i)
  if found == False:
    return "None"

@app.route('/')
def page1():
  return ""

@app.route('/new')
def page2():
  new = random.randint(10000,9999999)
  db.append(["", new, ""])
  return str(new)

@app.route('/data/<code>', methods = ["GET", "POST"])
def page3(code):
  if find(code) == "None":
    return "Not found"
  else:
    index = find(code)
    if request.method == "GET":
      return db[index][0]
    else:
      oldData = db[index][2]
      db[index] = [request.form, code, oldData]
      return "Done"

@app.route('/delete/<code>')
def page4(code):
  if find(code) == "None":
    return "Not found"
  else:
    del db[find(code)]
    return "Successfully deleted "+code

@app.route('/command/<code>', methods = ["GET", "POST"])
def page5(code):
  if find(code) == "None":
    return "Not found"
  else:
    index = find(code)
    if request.method == "GET":
      data = db[index][2]
      db[index][2] = ""
      return data
    else:
      oldData = db[index][1]
      db[index] = [oldData, code, request.form]
      return "Done"
# set website
def run():
    app.run(host="0.0.0.0", port=8080)

def keep_alive():
    server = Thread(target=run)
    server.start()
run()
keep_alive()
