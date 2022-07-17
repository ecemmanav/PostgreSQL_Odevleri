Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.

-- film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT(*) FROM film
WHERE length >
(
SELECT AVG(length) FROM film 
);

-- film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT COUNT(
    (SELECT MAX(rental_rate) FROM film)
) FROM film;

-- film tablosunda en düşük rental_rate ve en düşük replacement_cost değerlerine sahip filmleri sıralayınız.
SELECT title FROM film
WHERE (rental_rate = (SELECT MIN(rental_rate) FROM film)) AND (replacement_cost = (SELECT MIN(replacement_cost) FROM film));

-- payment tablosunda en fazla sayıda alışveriş yapan müşterileri (customer) sıralayınız.
SELECT CONCAT(first_name, ' ', last_name) AS "customer_name" FROM customer
JOIN payment ON payment.customer_id = customer.customer_id 
GROUP BY payment.customer_id, customer.first_name, customer.last_name ORDER BY COUNT(payment.amount) DESC;
