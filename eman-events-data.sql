INSERT INTO phr_events (title, start_date_time, end_date_time) VALUES
('Alluvium', '2014-05-16 20:00:00', '2014-05-18 14:00:00');

INSERT INTO phr_stages (event_id, title) VALUES
(1, 'Psytrance'),
(1, 'Techno');

INSERT INTO phr_lineups (stage_id, start_date_time, end_date_time) VALUES
(1, '2014-05-16 20:00:00', '2014-05-18 14:00:00');

INSERT INTO phr_slots (lineup_id, artist_id) VALUES
(1, 5);

