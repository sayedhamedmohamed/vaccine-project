## Table of contents
* [Technologies](#technologies)
* [Setup](#setup)
* [APIs](#apis)

## Technologies
* Maven
* Java: 1.8
* Springboot: 2.4.3 with Rest, JPA, Scheduler and Cache
* H2 Database
* iText
	
## Setup
$ cd JAR_PATH
$ java -jar vaccnow-0.0.1-SNAPSHOT.jar

```
Sample data:
 1. Branches  -Cairo and Down Town
 2. Vaccines  - Vaccine1 and Vaccine2
 3. Entries - Appointment user1@user.com, user2@user.com and user3@user.com
 4. Vaccination is done for user2@user.com and his invoice & certificate will be located in root directory
 5. You can run post(Schedule vaccination) and put(Apply vaccination) commands for testing - user5@user.com


## APIs
>> visit http://localhost:8085/swagger-ui.html

## Availability
 * Get a list of all branches
http://localhost:8085/api/v1/availability/list-branches
 * Get a list of all available vaccines per branch
http://localhost:8085/api/v1/availability/list-vaccines
 * Get a specific availability by branch
http://localhost:8085/api/v1/availability/list-vaccines/201
 * Get available time for a branch
http://localhost:8085/api/v1/availability/available-branch-time/201

## Vaccination

 * Schedule vaccination timeslot (15 minutes)
```
curl -X POST http://localhost:8085/api/v1/vaccination/schedule-vaccination-timeslot --header "Content-Type: application/json" -d '{"email":"user5@user.com","branchId":"201","vaccineId":"101","slotDate":"2020-12-31 10:15"}'
```
 * Choose Payment Method Cash, Credit, or Fawry
NA
 * Confirm scheduled vaccination by email
Print in logs after booking time slot instead of mail configuration
 * Apply vaccination - Scheduler will generate invoice and certificate sample in 10 second in root directory.
```
curl -X PUT http://localhost:8085/api/v1/vaccination/confirm-vaccination/user5@user.com
```

## Reporting
 * Get a list of all applied vaccination per branch
http://localhost:8085/api/v1/reporting/applied-vaccination-per-branch/201
 * Get a list of all applied vaccination per day/period
http://localhost:8085/api/v1/reporting/applied-vaccination-per-day
http://localhost:8085/api/v1/reporting/applied-vaccination-per-day/2020-12-26/2020-12-31
 * Show all confirmed vaccinations over a time period 
http://localhost:8085/api/v1/reporting/confirmed-vaccinations/2020-12-26/2020-12-31

## BONUS POINTS
 * Invoice Generation
Scheduler - SchedularServiceUtil
File Path - Project directory

 * Vaccine Certificate Generation
Scheduler - SchedularServiceUtil
File Path - Project directory

 * H2 Database
 http://localhost:8080/h2-console
 jdbc:h2:mem:testdb
 user - sa
 password - 

