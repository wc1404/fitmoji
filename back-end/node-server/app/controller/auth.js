'use strict';

const Controller = require('egg').Controller;

class AuthController extends Controller {
  async check() {
    const ctx = this.ctx;
    if (ctx.session.userId) {
      const user = await ctx.model.Users.findOne({
        where: { user_id: ctx.session.userId },
      });
      ctx.status = 200;
      ctx.body = { data: user };
    } else {
      ctx.status = 401;
      ctx.body = { msg: 'no session' };
    }
  }
  async login() {
    const ctx = this.ctx;
    const { phone_num, pass } = ctx.request.body;
    const user = await ctx.model.Users.findOne({
      where: { phone_num: +phone_num },
    });
    this.logger.info(user);
    if (user.pass === pass) {
      ctx.status = 200;
      ctx.body = { data: 'OK' };
      ctx.session.userId = user.user_id;
    } else {
      ctx.status = 401;
      ctx.body = { msg: 'invalid password or phone_number' };
    }
  }
}

module.exports = AuthController;
