'use strict';

module.exports = app => {
  const { INTEGER, STRING, DATE } = app.Sequelize;
  return app.model.define(
    'challenge',
    {
      challenge_id: {
        type: INTEGER(11),
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
      },
      time_created: {
        type: DATE,
        allowNull: true,
        defaultValue: app.Sequelize.literal('CURRENT_TIMESTAMP'),
      },
      type: {
        type: STRING(8),
        allowNull: true,
      },
      creator_id: {
        type: INTEGER(11),
        allowNull: true,
        references: {
          model: 'users',
          key: 'user_id',
        },
      },
      name: {
        type: STRING(32),
        allowNull: true,
      },
    },
    {
      tableName: 'challenge',
    }
  );
};
