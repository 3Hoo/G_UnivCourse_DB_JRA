from types import MethodDescriptorType
from flask.signals import request_tearing_down
import psycopg2
import os
from flask import Flask, render_template, request, flash, url_for
from werkzeug.datastructures import CharsetAccept
from werkzeug.utils import redirect, secure_filename
app = Flask(__name__)

connect = psycopg2.connect("dbname=jra user=postgres password=0000")
cur = connect.cursor()

UPLOAD_FOLDER = './static/image'
ALLOWED_EXTENSIONS = set(['jpg'])

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/main', methods = ["GET", "POST"])
def main():
    #id = request.form["id"]
    #pw = request.form["password"]

    #cur.execute("SELECT ID FROM Users WHERE ID = '{}' and PW = '{}'".format(id, pw))
    #user = cur.fetchall()

    return render_template("main.html")

@app.route('/', methods = ["GET", "POST"])
def login():
    if request.method == "POST" : 
        request_type = request.form['login_type'] 

        if request_type == "register" : 
            new_id = request.form['id']
            new_pw = request.form['password']
            cur.execute("INSERT INTO Users VALUES ('{}', '{}')".format(new_id, new_pw))

        elif request_type == "update" :
            id = request.form['id']
            new_pw = request.form['password']
            cur.execute("UPDATE Users SET PW = CASE WHEN ID = '{}' THEN '{}' ELSE PW END".format(id, new_pw))

        elif request_type == "delete" :
            id = request.form['id']
            cur.execute("DELETE FROM Users where ID = '{}'".format(id))
    
    return render_template("login.html")

@app.route('/horses')
def print_horses_info():
    cur.execute("SELECT horse.horse FROM horse ORDER BY horse.horse;")
    result = cur.fetchall()

    return render_template("horses.html", horses_info = result)

@app.route('/horse_info', methods = ['POST', 'GET'])
def show_horse_info() :
    horse_name = request.form['horse']

    horse_info = horse_name

    cur.execute("SELECT farm.farm, farm.location FROM farm, horse WHERE horse.horse = '{}' and horse.farm = farm.farm;".format(horse_name))
    farm_info = cur.fetchall()

    cur.execute("SELECT horse.birth FROM horse WHERE horse.horse = '{}';".format(horse_name))
    birth_info = cur.fetchall()

    cur.execute("SELECT horse.death FROM horse WHERE horse.horse = '{}';".format(horse_name))
    dead_info = cur.fetchall()

    cur.execute("SELECT horse.gender FROM horse WHERE horse.horse = '{}';".format(horse_name))
    gender_info = cur.fetchall()

    cur.execute("SELECT horse.sire FROM horse WHERE horse.horse = '{}';".format(horse_name))
    sire_info = cur.fetchall()

    cur.execute("SELECT horse.dam FROM horse WHERE horse.horse = '{}';".format(horse_name))
    dam_info = cur.fetchall()

    cur.execute("SELECT horse.record FROM horse WHERE horse.horse = '{}';".format(horse_name))
    record_info = cur.fetchall()

    cur.execute("SELECT horse.earnings FROM horse WHERE horse.horse = '{}';".format(horse_name))
    earned_info = cur.fetchall()
    earned_info = str(earned_info[0])
    characters = "(,)"
    for x in range(len(characters)) :
        earned_info = earned_info.replace(characters[x], "")
    earned_info = int(earned_info)

    cur.execute("SELECT title, year, racecourse, grade, distance, prize FROM major_win NATURAL JOIN race WHERE horse = '{}' ORDER BY year ASC;".format(horse_name))
    win_info = cur.fetchall()

    image_path = "image/" + horse_info + ".jpg"

    return render_template("horse_info.html", horse=horse_info, farm=farm_info[0], birth=birth_info[0], dead=dead_info[0], gender=gender_info[0],
            sire=sire_info[0], dam=dam_info[0], record=record_info[0], earned=earned_info, win=win_info, image_path = image_path)


@app.route('/farms', methods = ["GET"])
def print_farms() :
    cur.execute("SELECT farm.farm, farm.location, (SELECT COUNT(horse.horse) FROM horse WHERE horse.farm = farm.farm) FROM farm;")
    farms_info = cur.fetchall()

    return render_template("farms.html", farms_info = farms_info)

@app.route('/farm_info', methods = ["GET", "POST"])
def print_farm_info() :
    farm_name = request.form['farm']
    cur.execute("SELECT horse.horse FROM horse WHERE horse.farm = '{}';".format(farm_name))
    horses = cur.fetchall()
    cur.execute("SELECT location FROM farm WHERE farm = '{}';".format(farm_name))
    loc = cur.fetchall()

    return render_template("farm_info.html", horses = horses[0], location=loc[0])

@app.route('/racecourses', methods = ["GET"])
def print_racecourses() :
    cur.execute("SELECT * FROM racecourse")
    racecourses_info = cur.fetchall()

    return render_template("racecourses.html", racecourses_info = racecourses_info)

@app.route('/racecourse_popup', methods = ["POST", "GET"])
def print_racecourse_popup() : 
    course_name = request.form["formData"]

    cur.execute("SELECT race.title FROM race WHERE race.racecourse = '{}';".format(course_name))
    races = cur.fetchall()

    return render_template("racecourse_popup.html", races=races, course_name=course_name)

@app.route('/races', methods = ["GET"])
def print_races() :
    cur.execute("SELECT * FROM race ORDER BY grade DESC;")
    races_info = cur.fetchall()

    return render_template("races.html", races_info=races_info)

@app.route('/race_winner', methods = ["GET", "POST"])
def print_race_winner() : 
    race_name = request.form["race"]

    cur.execute("SELECT horse, year FROM major_win WHERE title = '{}' ORDER BY year ASC;".format(race_name))
    winners = cur.fetchall()

    return render_template("race_winner.html", winners=winners, race_name=race_name)

@app.route('/data_modify', methods = ["POST", "GET"])
def print_data_modify() :
    #password = request.form["password"] => 작동을 안함...
    
    #if password == "admin" : 
    #    return render_template("data_modify.html")
    #else :
    #   return redirect(url_for("main"))

    return render_template("data_modify.html")

@app.route('/register', methods = ["GET", "POST"])
def print_register() :
    job_type = request.form['job_type']

    return render_template("register.html", job_type = job_type)

@app.route('/register_progress', methods=["POST", "GET"])
def register_progress() :
    job_type = request.form['job_type']

    if job_type == "insert_farm" :
        farm_name = request.form['farm_name']
        farm_location = request.form['farm_location']
        cur.execute("INSERT INTO farm VALUES ('{}', '{}')".format(farm_name, farm_location))
        connect.commit()

    elif job_type == "insert_horse" :
        horse_image = request.files.get('horse_image', None)
        horse_name = request.form['horse_name']
        horse_farm = request.form['horse_farm']
        horse_birth = request.form['horse_birth']
        horse_death = request.form['horse_death']
        horse_gender = request.form['horse_gender']
        horse_sire = request.form['horse_sire']
        horse_dam = request.form['horse_dam']
        horse_record = request.form['horse_record']
        horse_earnings = request.form['horse_earnings']
        cur.execute("INSERT INTO horse VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', {})".format(horse_name, horse_farm, horse_birth, horse_death, horse_gender, horse_sire, horse_dam, horse_record, horse_earnings))
        connect.commit()
        if horse_image : 
            path = secure_filename(horse_image.filename)
            horse_image.save(os.path.join(app.config['UPLOAD_FOLDER'], path))

    elif job_type == "insert_win" : 
        win_horse = request.form['win_horse']
        win_title = request.form['win_title']
        win_grade = request.form['win_grade']
        win_racecourse = request.form['win_racecourse']
        win_year = request.form['win_year']
        cur.execute("INSERT INTO major_win VALUES ('{}', '{}', '{}', '{}', '{}')".format(win_horse, win_title, win_grade, win_racecourse, win_year))
        connect.commit()

    elif job_type == "delete_farm" : 
        farm_name = request.form['farm_name']
        cur.execute("DELETE FROM major_win WHERE major_win.horse = (SELECT horse FROM horse WHERE farm = '{}')".format(farm_name))
        cur.execute("DELETE FROM horse WHERE farm = '{}'".format(farm_name))
        cur.execute("DELETE FROM farm WHERE farm = '{}'".format(farm_name))
        connect.commit()

    elif job_type == "delete_horse" :
        horse_name = request.form['horse_name']
        cur.execute("DELETE FROM major_win WHERE horse = '{}'".format(horse_name))
        cur.execute("DELETE FROM horse WHERE horse = '{}'".format(horse_name))
        connect.commit()

    elif job_type == "update_horse" : 
        horse_name = request.form['horse_name']
        horse_death = request.form['horse_death']
        horse_record = request.form['horse_record']
        horse_earnings = request.form['horse_earnings']
        cur.execute("UPDATE horse SET death = '{}' WHERE horse = '{}".format(horse_death, horse_name))
        cur.execute("UPDATE horse SET record = '{}' WHERE horse = '{}".format(horse_record, horse_name))
        cur.execute("UPDATE horse SET earnings = '{}' WHERE horse = '{}".format(horse_earnings, horse_name))
        connect.commit()

    return render_template("data_modify.html")

if __name__ == '__main__':
    app.run()
