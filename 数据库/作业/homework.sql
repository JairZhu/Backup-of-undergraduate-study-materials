SELECT M.name
FROM member M
WHERE 5 < (SELECT count(isbn)
           FROM book NATURAL JOIN borrowed AS T
           WHERE M.memb_no = T.memb_no
           GROUP BY T.publisher);