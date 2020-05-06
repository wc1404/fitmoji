'use strict';

module.exports = app => {
  const { STRING, INTEGER } = app.Sequelize;
  return app.model.define(
    'users',
    {
      user_id: {
        type: INTEGER(11),
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
      },
      first_name: {
        type: STRING(16),
        allowNull: true,
      },
      last_name: {
        type: STRING(16),
        allowNull: true,
      },
      pass: {
        type: STRING(255),
        allowNull: false,
      },
      phone_num: {
        type: STRING(16),
        allowNull: false,
      },
      email: {
        type: STRING(32),
        allowNull: true,
      },
      weight: {
        type: INTEGER(11),
        allowNull: true,
      },
      birthday: {
        type: INTEGER(11),
        allowNull: false,
      },
      points: {
        type: INTEGER(11),
        allowNull: true,
      },
    },
    {
      tableName: 'users',
    }
  );
};
