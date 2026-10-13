import random
from datetime import date, timedelta
from faker import Faker
import psycopg2

fake = Faker()

# Connect to Postgres running in Docker
conn = psycopg2.connect(
    host="127.0.0.1",
    port=5433,
    dbname="hr_db",
    user="hr_admin",
    password="hr_password"
)
cur = conn.cursor()

# ---- 1. Departments ----
departments = ["Engineering", "Sales", "Marketing", "HR", "Finance", "Support"]
locations = ["Mumbai", "Bangalore", "Delhi", "Remote"]

dept_ids = []
for dept in departments:
    cur.execute(
        "INSERT INTO raw.departments (name, location) VALUES (%s, %s) RETURNING id",
        (dept, random.choice(locations))
    )
    dept_ids.append(cur.fetchone()[0])

# ---- 2. Employees (with intentional messiness) ----
statuses = ["active", "terminated", "on_leave"]
num_employees = 500

for i in range(1, num_employees + 1):
    name = fake.name()
    dept_id = random.choice(dept_ids)
    salary = round(random.uniform(30000, 150000), 2)
    hire_date = fake.date_between(start_date="-8y", end_date="today")
    manager_id = random.choice([None] + list(range(1, i))) if i > 1 else None
    status = random.choice(statuses)

    # --- Inject messiness on purpose ---
    if random.random() < 0.03:  # ~3% null salaries
        salary = None
    if random.random() < 0.01:  # ~1% wild outlier salary (typo simulation)
        salary = salary * 1000 if salary else 5000000
    if random.random() < 0.02:  # ~2% missing hire dates
        hire_date = None
    if random.random() < 0.02:  # ~2% duplicate employee IDs (bug simulation)
        emp_id = random.randint(1, i)
    else:
        emp_id = i

    cur.execute(
        """INSERT INTO raw.employees 
           (id, name, department_id, salary, hire_date, manager_id, status)
           VALUES (%s, %s, %s, %s, %s, %s, %s)""",
        (emp_id, name, dept_id, salary, hire_date, manager_id, status)
    )

# ---- 3. Salary history ----
cur.execute("SELECT id, salary FROM raw.employees WHERE salary IS NOT NULL")
rows = cur.fetchall()

for emp_id, current_salary in random.sample(rows, min(200, len(rows))):
    old_salary = round(float(current_salary) * random.uniform(0.7, 0.95), 2)
    change_date = date.today() - timedelta(days=random.randint(30, 1000))
    cur.execute(
        """INSERT INTO raw.salary_history 
           (employee_id, old_salary, new_salary, change_date)
           VALUES (%s, %s, %s, %s)""",
        (emp_id, old_salary, current_salary, change_date)
    )

conn.commit()
cur.close()
conn.close()

print("Done! Fake HR data loaded into raw schema.")