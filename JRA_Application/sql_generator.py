import os

def initialize_sql(filepath) :
    sql = open(filepath, mode='w', encoding='utf8')
    sql.write("DROP TABLE Major_Win;\n")
    sql.write("DROP TABLE Race;\n")
    sql.write("DROP TABLE Racecourse;\n")
    sql.write("DROP TABLE Horse;\n")
    sql.write("DROP TABLE Farm;\n")
    sql.write("DROP TABLE Users;\n")
    sql.write("\n\n")
    sql.write("CREATE TABLE Farm(Farm varchar(25), Location varchar(50), primary key (Farm));\n")
    sql.write("CREATE TABLE Horse(Horse varchar(25), Farm varchar(25), Birth char(20), Death char(20), Gender varchar(10), Sire varchar(25), Dam varchar(25), Record varchar(10), Earnings integer, primary key (Horse), foreign key (Farm) references Farm);\n")
    sql.write("CREATE TABLE Racecourse(Racecourse varchar(15), Location varchar(100), Established char(4), primary key (Racecourse));\n")
    sql.write("CREATE TABLE Race(Title varchar(30), Grade char(2), Racecourse varchar(15), Track varchar(15), Distance varchar(10), Prize integer, primary key (Title, Grade, Racecourse), foreign key (Racecourse) references Racecourse);\n")
    sql.write("CREATE TABLE Major_Win(Horse varchar(25), Title varchar(30), Grade char(2), Racecourse varchar(15), Year char(4), foreign key (Horse) references Horse, foreign key (Title, Grade, Racecourse) references Race);\n")
    sql.write("CREATE TABLE Users(ID varchar(25), PW varchar(25), primary key (ID, PW));\n")
    sql.write("\n\n\n")

    sql.close()


def farm_sql(filepath):
    txt = open("Farm.txt", mode='rt', encoding='utf8')
    sql = open(filepath, mode='a+', encoding='utf8')

    while True:
        line = txt.readline()
        if not line :
            break
        l = line.split('\t')
        l[len(l)-1] = l[len(l)-1].strip()
        sql.write("INSERT INTO Farm values ('{}', '{}');\n".format(l[0], l[1]))

    sql.write("\n\n\n")

    txt.close()
    sql.close()

def horse_sql(filepath):
    txt = open("Horse.txt", mode='rt', encoding='utf8')
    sql = open(filepath, mode='a+', encoding='utf8')

    while True:
        line = txt.readline()
        if not line :
            break
        l = line.split('\t')
        l[len(l)-1] = l[len(l)-1].strip()
        sql.write("INSERT INTO Horse values ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', {});\n".format(l[0], l[1], l[2], l[3], l[4], l[5], l[6], l[7], l[8]))

    sql.write("\n\n\n")

    txt.close()
    sql.close()

def racecourse_sql(filepath):
    txt = open("RaceCourse.txt", mode='rt', encoding='utf8')
    sql = open(filepath, mode='a+', encoding='utf8')

    while True:
        line = txt.readline()
        if not line :
            break
        l = line.split('\t')
        l[len(l)-1] = l[len(l)-1].strip()
        sql.write("INSERT INTO Racecourse values ('{}', '{}', '{}');\n".format(l[0], l[1], l[2]))

    sql.write("\n\n\n")
    
    txt.close()
    sql.close()

def race_sql(filepath):
    txt = open("Races.txt", mode='rt', encoding='utf8')
    sql = open(filepath, mode='a+', encoding='utf8')

    while True:
        line = txt.readline()
        if not line :
            break
        l = line.split('\t')
        l[len(l)-1] = l[len(l)-1].strip()
        sql.write("INSERT INTO Race values ('{}', '{}', '{}', '{}', '{}', {});\n".format(l[0], l[1], l[2], l[3], l[4], l[5]))

    sql.write("\n\n\n")

    txt.close()
    sql.close()

def majorwin_sql(filepath):
    txt = open("Major_Wins.txt", mode='rt', encoding='utf8')
    sql = open(filepath, mode='a+', encoding='utf8')

    while True:
        line = txt.readline()
        if not line :
            break
        l = line.split('\t')
        l[len(l)-1] = l[len(l)-1].strip()
        sql.write("INSERT INTO Major_Win values ('{}', '{}', '{}', '{}', '{}');\n".format(l[0], l[1], l[2], l[3], l[4]))

    sql.write("\n\n\n")

    txt.close()
    sql.close()

def user_sql(filepath) : 
    txt = open("Users.txt", mode="rt", encoding='utf8')
    sql = open(filepath, mode='a+', encoding='utf8')

    while True :
        line = txt.readline()
        if not line :
            break
        l = line.split('\t')
        l[len(l)-1] = l[len(l)-1].strip()
        sql.write("INSERT INTO Users values ('{}', '{}');\n".format(l[0], l[1]))

    sql.write("\n\n\n")

    txt.close()
    sql.close()


        

if __name__ == "__main__" :
    initialize_sql("sql.txt")
    farm_sql("sql.txt")
    horse_sql("sql.txt")
    racecourse_sql("sql.txt")
    race_sql("sql.txt")
    majorwin_sql("sql.txt")
    user_sql("sql.txt")
