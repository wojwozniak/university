# Task01, List05

Design alternative schema of table to conform to (1/2/3/3.5)NF

Explaination of 1NF, 2NF, 3NF, 3,5NF -> [Link to explaination from I1.Databases](../../../Databases/List05/task1-4.pdf)



## Base table

| ID  | Patient    | Patient Address            | Appointment Time and Location | Price  | Physician     | Appointment Cause                          |
| --- | ---------- | -------------------------- | ----------------------------- | ------ | ------------- | ------------------------------------------ |
| 1   | Jan Kot    | 6 Dolna Street, 44-444 Bór | 2029-02-01 12:30, room 12     | 300 zł | Oleg Wyrwiząb | Dental: Denture fitting in (. . . )        |
| 2   | Maria Mysz | 9 Górna Street, 55-555 Las | 2030-01-04 11:45, room 7      | 150 zł | Ewa Ciarka    | Dermatology: Birthmark inspection (. . . ) |


## Idea

It is obvious there are some problems with this schema (a lot of redundancy). We can fix it by dividing this table into three separate ones (Patients, Physicians, Appointments)

## Solution

### Patients

| ID  | Patient    | Patient Address            |
| --- | ---------- | -------------------------- |
| 1   | Jan Kot    | 6 Dolna Street, 44-444 Bór |
| 2   | Maria Mysz | 9 Górna Street, 55-555 Las |

### Physicians

| ID  | Physician     |
| --- | ------------- |
| 1   | Oleg Wyrwiząb |
| 2   | Ewa Ciarka    |

### Appointments

| ID  | ID_Patient | ID_Physician | Price  | Appointment Time and Location | Appointment Cause                          |
| --- | ---------- | ------------ | ------ | ----------------------------- | ------------------------------------------ |
| 1   | 1          | 1            | 300 zł | 2029-02-01 12:30, room 12     | Dental: Denture fitting in (. . . )        |
| 2   | 2          | 2            | 150 zł | 2030-01-04 11:45, room 7      | Dermatology: Birthmark inspection (. . . ) |

## Note

There is a possibility that there exists a functional dependency <b>(Physician, Cause) -> Price</b> but we didn't get data to determine that. We could also have different table for reservations (but here too we don't have data that would force us to do that (no proof of 3NF rules being broken))