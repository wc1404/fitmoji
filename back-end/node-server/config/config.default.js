'use strict';

module.exports = appInfo => {
  const config = (exports = {});

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_{{keys}}';

  // add your config here
  config.middleware = [];

  config.sequelize = {
    dialect: 'mysql',
    host: 'localhost',
    port: 8889,
    database: 'fitmoji',
    username: 'root',
    password: 'root',
    define: {
      timestamps: false,
    },
  };

  config.onerror = {
    json(err, ctx) {
      ctx.body = { message: 'server error', error_type: err.type || 'unknown' };
      ctx.status = 500;
    },
  };
  config.security = {
    csrf: {
      enable: false,
    },
  };

  return config;
};
