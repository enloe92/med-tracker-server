BEGIN;

TRUNCATE
    usersgames,
    rules,
    games,
    users
    RESTART IDENTITY CASCADE;

INSERT INTO users (user_name, password)
VALUES
-- test_man, pass
('test_man', '$2a$16$6GFb.JN.2DQo0w/mc8.xuunyjWUrfVnTOjjSc5mReGA6Eb8LqK0iS'),
('other_user', '$2a$16$.AfT/pDKGyGKcPHsv1Ac/uQXk5tuq/Hc8PPDtQKbMvL/cjN5BoGhW');

INSERT INTO games (game_name)
VALUES
('Over The Counter'),
('Prescribed');

INSERT INTO rules (game_id, rule_title, rule_description, assigned_user)
VALUES
(1, 'Tylenol', 'example side effects. days/times to take medication', 1),
(1, 'Medication 2', 'example side effects. days/times to take medication', 1),
(1, 'Medication 3', 'example side effects. days/times to take medication', 2),
(2, 'Medication 4', 'example side effects. days/times to take medication', 1),
(2, 'Medication 5', 'example side effects. days/times to take medication', 1),
(2, 'Medication 6', 'example side effects. days/times to take medication', 2);

INSERT INTO usersgames (user_id, game_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2);

COMMIT;