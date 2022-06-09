#!/bin/bash
python3 main.py > A_populate_schema.sql
psql -d tanuki < ../app/db/0_create_schema.sql
psql -d tanuki < A_populate_schema.sql
