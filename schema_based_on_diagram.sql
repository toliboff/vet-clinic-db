CREATE DATABASE clinic;

CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(50),
  date_of_birth DATE
);

CREATE TABLE medical_histories(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(50),
  FOREIGN KEY(patient_id) REFERENCES patients(id)
);