CREATE TABLE stock_prices (
    track_date date,
    open_pr number(12, 6),
    high_pr number(12, 6),
    low_pr number(12, 6),
    close_pr number(12, 6),
    adj_pr number(12, 6),
    stc_vol number
);
+
-- drop table stock_prices;

CREATE TABLE STC_PR_T (
    track_date date,
    open_pr number(12, 6),
    high_pr number(12, 6),
    low_pr number(12, 6),
    close_pr number(12, 6),
    adj_pr number(12, 6),
    stc_vol number,
    s_symbol varchar2(7 char),
    s_id number,
    primary key (track_date, s_id)
);

INSERT INTO STC_PR_T
select track_date, open_pr, high_pr, low_pr, close_pr, adj_pr, stc_vol, 'AMZN', 2
from stock_prices;

SELECT EXTRACT(month from track_date), EXTRACT(year from track_date), s_id, min(open_pr), avg(adj_pr), sum(stc_vol) from stc_pr_t
group by EXTRACT(year FROM track_date), EXTRACT(month FROM track_date), s_id
order by s_id asc, EXTRACT(year FROM track_date) asc, EXTRACT(month FROM track_date) asc;

select to_number(to_char(track_date, 'YYYY-MM')) from stc_pr_t;