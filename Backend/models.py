from db_connection import db


class User(db.Model):
    __tablename__ = 'User'
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer)
    identity_number = db.Column(db.String(100))
    password = db.Column(db.String(100))
    fullname = db.Column(db.String(100))
    email = db.Column(db.String(100))
    phone = db.Column(db.String(20))
    activation = db.Column(db.Boolean)
    reset_code = db.Column(db.String(6))
    code_expiration = db.Column(db.DateTime)
    age = db.Column(db.String(10))
    gender = db.Column(db.String(6))

    def __init__(self, user_id, identity_number, password, fullname, email, phone, activation,  reset_code, code_expiration, age, gender):
        self.user_id = user_id
        self.identity_number = identity_number
        self.password = password
        self.fullname = fullname
        self.email = email
        self.phone = phone
        self.activation = activation
        self.reset_code = reset_code
        self.code_expiration = code_expiration
        self.age = age
        self.gender = gender


class medicines(db.Model):
    __tablename__ = 'medicines'
    id = db.Column(db.Integer, primary_key=True)
    drug_id = db.Column(db.Integer)
    drug = db.Column(db.String(255))
    drug_piece = db.Column(db.Integer)
    drug_dose = db.Column(db.Integer)

    def __init__(self, id, drug_id, drug, drug_piece, drug_dose):
        self.id = id
        self.drug_id = drug_id
        self.drug = drug
        self.drug_piece = drug_piece
        self.drug_dose = drug_dose


class patientInformation(db.Model):
    __tablename__ = 'patientInformation'
    id = db.Column(db.Integer, primary_key=True)
    patient_id = db.Column(db.Integer)
    identity_number = db.Column(db.String(100))
    drug_id = db.Column(db.Integer)
    drug_start_date = db.Column(db.DateTime)
    morning = db.Column(db.Boolean)
    morning_time = db.Column(db.Time)
    morning_use = db.Column(db.Boolean)
    noon = db.Column(db.Boolean)
    noon_time = db.Column(db.Time)
    noon_use = db.Column(db.Boolean)
    evening = db.Column(db.Boolean)
    evening_time = db.Column(db.Time)
    evening_use = db.Column(db.Boolean)

    def __init__(self, id, patient_id, identity_number, drug_id, drug_start_date, morning, morning_time, morning_use, noon, noon_time, noon_use, evening, evening_time, evening_use):
        self.id = id
        patient_id = patient_id
        self.identity_number = identity_number
        self.drug_id = drug_id
        self.drug_start_date = drug_start_date
        self.morning = morning
        self.morning_time = morning_time
        self.morning_use = morning_use
        self.noon = noon
        self.noon_time = noon_time
        self.noon_use = noon_use
        self.evening = evening
        self.evening_time = evening_time
        self.evening_use = evening_use
