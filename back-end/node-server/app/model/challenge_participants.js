'use strict';

module.exports = app => {
  const { INTEGER, DATE } = app.Sequelize;
  return app.model.define(
    'challenge_participants',
    {
      participant_id: {
        type: INTEGER(11),
        allowNull: false,
        primaryKey: true,
        references: {
          model: 'users',
          key: 'user_id',
        },
      },
      challenge_id: {
        type: INTEGER(11),
        allowNull: false,
        primaryKey: true,
        references: {
          model: 'challenge',
          key: 'challenge_id',
        },
      },
      time_joined: {
        type: DATE,
        allowNull: true,
        defaultValue: '0000-00-00 00:00:00',
      },
      has_accepted: {
        type: INTEGER(1),
        allowNull: true,
        defaultValue: '0',
      },
    },
    {
      tableName: 'challenge_participants',
    }
  );
};
