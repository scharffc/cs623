# Sample of Python / MySQL 
# ACID is implemented

# pip install mysql-connector-python

import mysql.connector

print("Beginning")

# Change the credentials and the name of the database
# create table student(id integer, name varchar(10), primary key(id))

con = mysql.connector.connect(
  host="localhost",
  user="root",
  password="root",
  database="mysql"
)

print(con) 

#For isolation: SERIALIZABLE
con.start_transaction(isolation_level = 'SERIALIZABLE')
#For atomicity
con.autocommit = False

try:
    cur = con.cursor()
    #QUERY
    sql = "INSERT INTO student (id, name) VALUES (%s, %s)"
    val = (1000, "Smith")
    cur.execute(sql, val)
except (Exception) as err:
    print(err)
    print("Transactions could not be completed so database will be rolled back before start of transactions")
    con.rollback()
finally:
    if con:
        con.commit()
        cur.close
        con.close
        print("PostgreSQL connection is now closed")

print("End")

