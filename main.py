import psycopg2

db_host = "localhost"
db_port = "5432"
db_name = "kalbe"
db_user = "postgres"
db_password = "novinganteng"

try:
    conn = psycopg2.connect(host=db_host, port=db_port, database=db_name, user=db_user, password=db_password)
    print("Connect")

    cur = conn.cursor()

    emp_f_name = "Rakamin"
    emp_l_name = "Ardian"
    age = 19
    sex = "male"
    income = 50000

    insert_query = f"INSERT INTO karyawan (first_name, last_name, age, sex, income) VALUES (%s, %s, %s, %s, %s)"

    cur.execute(insert_query, (emp_f_name, emp_l_name, age, sex, income))

    conn.commit()
    cur.close()
    conn.close()

    print('Data saved succesfully')
except Exception as e:
    print("Terjadi kesalahan:", e)