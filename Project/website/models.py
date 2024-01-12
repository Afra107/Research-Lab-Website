import pymysql

hostname = 'localhost'
user_name = 'root'
password_db = 'Afra@123'

db = pymysql.connections.Connection(host=hostname, user=user_name, password = password_db)

cursor = db.cursor()

cursor.execute("Use website_db")
cursor.execute("Select * from publicationv")

view = []
temp = []
temp_tuple = ()
for records in cursor:
    temp = list(records)
    temp = ["NULL" if x == '' else x for x in temp]
    temp_tuple = tuple(temp)
    view.append(temp_tuple)

viewtuple = tuple(view)

link = []
temp_link = ""
templ = []
cursor.execute("select * from publicationlink")
for records in cursor:
    templ = str(records[0])
    if templ == "":
        templ = "NULL"
    link.append(templ)


dict = {}
for i in range(len(viewtuple)):
    dict[link[i]] = viewtuple[i]



cursor.execute("select * from projectv")
view1 = []
for records in cursor:
    view1.append(records)

viewtuple1 = tuple(view1)


stu_list = []
stu_tuple = ()
cursor.execute("select * from stuv")
for records in cursor:
    stu_list.append(records)

stu_tuple = tuple(stu_list)


cursor.execute("select * from alumni")
alu_list = []
alu_tuple = ()
for records in cursor:
    alu_list.append(records)

alu_tuple = tuple(alu_list)