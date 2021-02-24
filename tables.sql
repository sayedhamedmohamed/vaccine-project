     
CREATE USER IF NOT EXISTS "SA" SALT '01232e0df3b67871' HASH '13e4222b652c46c47b26226f1c572059a39fd43e6d0b600dcb74b3ce48158b7d' ADMIN;         
CREATE SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_18E5D1C6_BAFB_4F97_A89E_052642C1EF1F" START WITH 4 BELONGS_TO_TABLE;
CREATE MEMORY TABLE "PUBLIC"."BRANCH"(
    "BRANCH_ID" INTEGER NOT NULL,
    "ACTIVE" SMALLINT,
    "BRANCH_NAME" VARCHAR(255),
    "CREATED_AT" TIMESTAMP,
    "CREATED_BY" INTEGER,
    "MODIFIED_AT" TIMESTAMP,
    "MODIFIED_BY" INTEGER,
    "TIME_FROM" TIME,
    "TIME_TO" TIME
);           
ALTER TABLE "PUBLIC"."BRANCH" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_7" PRIMARY KEY("BRANCH_ID");
  
CREATE MEMORY TABLE "PUBLIC"."BRANCH_VACCINE"(
    "BRANCH_VACCINE_ID" INTEGER NOT NULL,
    "ACTIVE" SMALLINT,
    "CREATED_AT" TIMESTAMP,
    "CREATED_BY" INTEGER,
    "MODIFIED_AT" TIMESTAMP,
    "MODIFIED_BY" INTEGER,
    "VACCINE_COUNT" INTEGER,
    "BRANCH_ID" INTEGER,
    "VACCINE_ID" INTEGER
);     
ALTER TABLE "PUBLIC"."BRANCH_VACCINE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_5" PRIMARY KEY("BRANCH_VACCINE_ID");
CREATE MEMORY TABLE "PUBLIC"."SCHEDULE_TIMESLOT"(
    "SCHEDULE_TIMESLOT_ID" INTEGER DEFAULT NEXT VALUE FOR "PUBLIC"."SYSTEM_SEQUENCE_18E5D1C6_BAFB_4F97_A89E_052642C1EF1F" NOT NULL NULL_TO_DEFAULT SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_18E5D1C6_BAFB_4F97_A89E_052642C1EF1F",
    "ACTIVE" SMALLINT,
    "CREATED_AT" TIMESTAMP,
    "CREATED_BY" INTEGER,
    "EMAIL" VARCHAR(255),
    "MODIFIED_AT" TIMESTAMP,
    "MODIFIED_BY" INTEGER,
    "SLOT_DATE" TIMESTAMP,
    "TRANSACTION_ID" VARCHAR(255),
    "TRANSACTION_STATUS" VARCHAR(255),
    "VACCINACTION_DONE" SMALLINT,
    "BRANCH_ID" INTEGER,
    "VACCINE_ID" INTEGER
);       
ALTER TABLE "PUBLIC"."SCHEDULE_TIMESLOT" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_3" PRIMARY KEY("SCHEDULE_TIMESLOT_ID");          
CREATE MEMORY TABLE "PUBLIC"."VACCINE"(
    "VACCINE_ID" INTEGER NOT NULL,
    "ACTIVE" SMALLINT,
    "CREATED_AT" TIMESTAMP,
    "CREATED_BY" INTEGER,
    "MODIFIED_AT" TIMESTAMP,
    "MODIFIED_BY" INTEGER,
    "VACCINE_NAME" VARCHAR(255)
);    
ALTER TABLE "PUBLIC"."VACCINE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_38" PRIMARY KEY("VACCINE_ID");             
ALTER TABLE "PUBLIC"."SCHEDULE_TIMESLOT" ADD CONSTRAINT "PUBLIC"."FKPB7IEYAGB2GJPTF8IX6C9K1BK" FOREIGN KEY("BRANCH_ID") REFERENCES "PUBLIC"."BRANCH"("BRANCH_ID") NOCHECK;    
ALTER TABLE "PUBLIC"."BRANCH_VACCINE" ADD CONSTRAINT "PUBLIC"."FKR3RK1ERFTN19T6B840T0AY5OG" FOREIGN KEY("BRANCH_ID") REFERENCES "PUBLIC"."BRANCH"("BRANCH_ID") NOCHECK;       
ALTER TABLE "PUBLIC"."BRANCH_VACCINE" ADD CONSTRAINT "PUBLIC"."FKJB84NMXXCSVJFI4YA0YGW7I52" FOREIGN KEY("VACCINE_ID") REFERENCES "PUBLIC"."VACCINE"("VACCINE_ID") NOCHECK;    
ALTER TABLE "PUBLIC"."SCHEDULE_TIMESLOT" ADD CONSTRAINT "PUBLIC"."FK8VSHHI3D0O5XNX5DIW0U37GTV" FOREIGN KEY("VACCINE_ID") REFERENCES "PUBLIC"."VACCINE"("VACCINE_ID") NOCHECK; 
