USE adlister_db;

INSERT INTO categories (category)
    VALUES ('Brown'),
           ('White'),
           ('Tinted'),
           ('Egg layers'),
           ('Meat birds'),
           ('Pets');

INSERT INTO ads (user_id, title, description)
    VALUES (1, 'Buff Silkie Bantam', 'Great pets with a unique appearance and history'),
           (1, 'Partridge Cochin Bantam', 'First bantams in england also called Pekin'),
           (1, 'Buff Laced Polish', 'Fluffy, Bearded Chicken'),
           (1, 'RedCaps', 'Rare and critically threatened breed'),
           (1, 'Amber Star', 'Great composite breed'),
           (1, 'American Bresse', 'High quality meat'),
           (1, 'Ginger Broiler', 'Fast growing composite breed');

INSERT INTO ad_cat (ad_id, cat_id)
    VALUES (1, 1),
           (1, 6),
           (2, 2),
           (2, 4),
           (3, 2),
           (3, 4),
           (4, 1),
           (4, 4),
           (5, 2),
           (5, 1),
           (6, 5),
           (6, 3),
           (7, 5),
           (7, 1);