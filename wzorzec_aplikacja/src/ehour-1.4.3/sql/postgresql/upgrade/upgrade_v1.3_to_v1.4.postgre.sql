INSERT INTO USER_ROLE (ROLE, NAME) VALUES('ROLE_MANAGER', 'MANAGER');

CREATE TABLE TIMESHEET_LOCK_EXCLUSION (
   LOCK_ID INTEGER,
   USER_ID INTEGER,
   CONSTRAINT PK PRIMARY KEY (LOCK_ID, USER_ID) USING INDEX TABLESPACE PG_DEFAULT,
   CONSTRAINT FK_EXCL_USER_ID FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT FK_EXCL_LOCK_ID FOREIGN KEY (LOCK_ID) REFERENCES TIMESHEET_LOCK (LOCK_ID) ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO CONFIGURATION (CONFIG_KEY, CONFIG_VALUE) VALUES('reminderEnabled', 'false');
INSERT INTO CONFIGURATION (CONFIG_KEY, CONFIG_VALUE) VALUES('reminderBody', 'Hello $name,\r\n\r\nThis is an automated message.\r\n\r\nOur records show that you have not posted your weekly hours online. Please be sure to post your hours by 5:30PM Friday.\r\n\r\nThank You,\r\n\r\neHour');
INSERT INTO CONFIGURATION (CONFIG_KEY, CONFIG_VALUE) VALUES('reminderTime', '0 30 17 * * FRI');
INSERT INTO CONFIGURATION (CONFIG_KEY, CONFIG_VALUE) VALUES('reminderSubject', 'Missing hours');
INSERT INTO CONFIGURATION (CONFIG_KEY, CONFIG_VALUE) VALUES('reminderMinimalHours', '32');


DROP TABLE MAIL_TYPE CASCADE;
DROP TABLE MAIL_LOG_ASSIGNMENT;

ALTER TABLE MAIL_LOG DROP COLUMN RESULT_MSG;
ALTER TABLE MAIL_LOG DROP COLUMN MAIL_TYPE_ID;
ALTER TABLE MAIL_LOG DROP COLUMN TO_USER_ID;
ALTER TABLE MAIL_LOG ADD COLUMN MAIL_EVENT VARCHAR(64);
ALTER TABLE MAIL_LOG ADD COLUMN MAIL_TO VARCHAR(255);
CREATE INDEX IDX_MAIL ON MAIL_LOG (MAIL_TO, MAIL_EVENT);

UPDATE CONFIGURATION SET CONFIG_VALUE = '1.4' WHERE CONFIG_KEY = 'version';

