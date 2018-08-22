/* 1.	List the titles and prices of all books that have the cheapest price. */

SELECT title, price
FROM titles
WHERE price = (SELECT MIN(price)
                FROM titles)

GO

/* 2.	List all titles that have sold more than 40 copies at a single store.*/

SELECT title
FROM titles
WHERE title_id IN (SELECT title_id
                    FROM sales
					GROUP BY title_id, stor_id
                    HAVING SUM(qty) > 40)

GO

/* 3.	List all authors who have not published any books.*/

SELECT au_fname, au_lname
FROM authors
WHERE au_id NOT IN (SELECT au_id
                    FROM titleauthor)

GO

/* 4.	List all the publishers who have published any business books.*/

SELECT pub_name
FROM publishers
WHERE pub_id IN (SELECT pub_id 
                    FROM titles
                    WHERE type = 'business')

GO

/* 5.	List all authors who have published a “popular computing” book (these books have type = 'popular_comp' in the titles table). */

SELECT au_fname, au_lname
FROM authors
WHERE au_id IN (SELECT titleauthor.au_id
                    FROM titleauthor
                    JOIN titles ON titles.title_id = titleauthor.title_id
                    WHERE titles.type = 'popular_comp')

GO

/* 6.	List all the cities where both an author (or authors) and a publisher (or publishers) are located.*/
SELECT DISTINCT city 
FROM publishers p
WHERE EXISTS (SELECT city
                FROM authors
				WHERE city = p.city)

GO

/* 7.	List all cities where an author, but no publisher, is located.*/

SELECT DISTINCT city
FROM authors a
WHERE NOT EXISTS (SELECT city
					FROM publishers
					WHERE city = a.city)

GO

/* 8.	List all titles that have sold no copies.*/

SELECT title
FROM titles t
WHERE NOT EXISTS (SELECT * 
                    FROM sales
                    WHERE title_id = t.title_id)

GO

/* 9.	List the title and total sales of each book whose total sales is less than the average totals sales across all books.*/

SELECT titles.title, SUM(sales.qty) as salesQty
FROM titles
JOIN sales ON sales.title_id = titles.title_id
GROUP BY titles.title
HAVING SUM(sales.qty) < (SELECT AVG(title_ave)
							FROM (SELECT AVG(qty) AS title_ave
									FROM sales
									GROUP BY title_id) as t)

GO

/* 10.	List the publishers, and the number of books each has published, who are not located in California.*/

SELECT publishers.pub_name, COUNT(titles.title_id) as "Num Books"
FROM publishers
JOIN titles ON titles.pub_id = publishers.pub_id
WHERE publishers.state != 'California'
GROUP BY publishers.pub_name

GO

/* 11.	For each book, list the number of stores where it has been sold.*/

SELECT titles.title, COUNT(sales.stor_id) AS "Number of Stores"
FROM titles
JOIN sales ON titles.title_id = sales.title_id
GROUP BY titles.title

GO

/* 12.	For each book, list its title, the largest quantity of it sold at any one store, and the name of that store.*/

SELECT titles.title, MAX(sales.qty) AS "Largest quantity sold", stores.stor_name
FROM titles
JOIN sales ON sales.title_id = titles.title_id
JOIN stores ON stores.stor_id = sales.stor_id
GROUP BY titles.title, stores.stor_name

GO

/* 13.	Increase by two points the royalty rate for all books that have sold more than 30 copies total.*/

UPDATE titles
SET royalty = royalty + 2
WHERE title_id IN (SELECT title_id
                    FROM sales
                    GROUP BY title_id
                    HAVING SUM(qty) > 30)

GO 

/* 14.	List all types of books published by more than one publisher.*/

SELECT type
FROM titles
GROUP BY type
HAVING COUNT(DISTINCT pub_id) > 1

GO
