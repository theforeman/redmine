#!/bin/bash
# Backs up the OpenShift PostgreSQL database for this application
 
FILENAME="$OPENSHIFT_DATA_DIR/$OPENSHIFT_APP_NAME.backup.sql.gz"
pg_dump $OPENSHIFT_APP_NAME | gzip > $FILENAME
