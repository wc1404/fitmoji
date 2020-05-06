'use strict';

module.exports = app => {
  const { INTEGER } = app.Sequelize;
  return app.model.define(
    'friend',
    {
      creator_id: {
        type: INTEGER(11),
        allowNull: false,
        primaryKey: true,
        references: {
          model: 'users',
          key: 'user_id',
        },
      },
      reciever_id: {
        type: INTEGER(11),
        allowNull: false,
        primaryKey: true,
        references: {
          model: 'users',
          key: 'user_id',
        },
      },
      has_accepted: {
        type: INTEGER(1),
        allowNull: true,
        defaultValue: '0',
      },
      is_close_friend: {
        type: INTEGER(1),
        allowNull: true,
        defaultValue: '0',
      },
    },
    {
      tableName: 'friend',
    }
  );
};
