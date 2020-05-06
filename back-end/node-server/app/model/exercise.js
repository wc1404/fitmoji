'use strict';

module.exports = app => {
  const { INTEGER, STRING } = app.Sequelize;
  return app.model.define(
    'exercise',
    {
      exercise_id: {
        type: INTEGER(11),
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
      },
      name: {
        type: STRING(32),
        allowNull: true,
      },
      point_rate: {
        type: INTEGER(11),
        allowNull: true,
        defaultValue: '1',
      },
      work_load: {
        type: INTEGER(11),
        allowNull: true,
        defaultValue: '1',
      },
    },
    {
      tableName: 'exercise',
    }
  );
};
