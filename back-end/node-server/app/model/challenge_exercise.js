'use strict';

module.exports = app => {
  const { INTEGER } = app.Sequelize;
  return app.model.define(
    'challenge_exercise',
    {
      challenge_id: {
        type: INTEGER(11),
        allowNull: false,
        primaryKey: true,
        references: {
          model: 'challenge',
          key: 'challenge_id',
        },
      },
      exercise_id: {
        type: INTEGER(11),
        allowNull: false,
        primaryKey: true,
        references: {
          model: 'exercise',
          key: 'exercise_id',
        },
      },
      creator_id: {
        type: INTEGER(11),
        allowNull: true,
        references: {
          model: 'users',
          key: 'user_id',
        },
      },
    },
    {
      tableName: 'challenge_exercise',
    }
  );
};
