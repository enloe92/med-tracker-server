const config = require('../config');

const GamesService = {
    getUserGames(db, user_id) {
        return db.select('*')
            .from('usersgames')
            .innerJoin('games', 'usersgames.game_id', 'games.id')
            .where({ user_id });
    },
    getAllGames(db) {
        return db.select('*')
            .from('games');
    },
    getIndividualGame(db, id) {
        return db.select('*')
            .from('games')
            .where({ id });
    }
};

module.exports = GamesService;