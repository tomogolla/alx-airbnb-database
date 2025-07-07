-- Turn on profiling for your session
SET profiling = 1;

-- Run a frequently used query
```sql
SELECT u.user_id, COUNT(*) 
  FROM booking b
  JOIN user u ON b.user_id = u.user_id
 GROUP BY u.user_id;
```
  
-- List recent profiles
SHOW PROFILES;
this returns:

| Query_ID | Duration | Query |
| --- | ---| --- | 
| 1 | | 0.01277075 | |SHOW WARNINGS |
| 2 | | 0.15189550 | | SELECT u.user_id, COUNT(*) \n  FROM booking b\n  JOIN user u ON b.user_id = u.user_id\n GROUP BY u.user_id |

## Identify bottlenecks
