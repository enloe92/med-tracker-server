CREATE TABLE usersgames (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id INTEGER REFERENCES users(id),
    game_id INTEGER REFERENCES games(id)
);