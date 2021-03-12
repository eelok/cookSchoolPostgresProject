
`connect ot conntainer, postgres - name of container`
docker exec -it postgres bash

`connect ot postgres in the container`
psql -U postgres

`show all databases`
\l 

`use databases`
\c  <name of database>

`show all tables`
\dt

`show tables's shema`
\d <name-tables>


`execute .sql file -d db name -u user`
psql -d cookschool -f cookSchool.sql -U postgres


