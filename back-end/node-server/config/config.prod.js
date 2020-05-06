'use strict';

module.exports = appInfo => {
  const config = (exports = {});

  config.sequelize = {
    dialect: 'mysql',
    host: 'ijj1btjwrd3b7932.cbetxkdyhwsb.us-east-1.rds.amazonaws.com',
    port: 3306,
    database: 'nrof9hul96775lxn',
    username: 'ogc7e1qgcgan2fo3',
    password: 'pn9nbmzoqgh292x1',
    define: {
      timestamps: false,
    },
  };

  return config;
};
